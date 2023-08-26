locals {
  k8s_version = "1.27"
  sa_name     = "k8s-user"
}

resource "yandex_kubernetes_cluster" "k8s-regional" {
  network_id = yandex_vpc_network.netology-vpc.id
  master {
    version = local.k8s_version
    public_ip = true
    regional {
      region = "ru-central1"
      location {
        zone      = yandex_vpc_subnet.public-a.zone
        subnet_id = yandex_vpc_subnet.public-a.id
      }
      location {
        zone      = yandex_vpc_subnet.public-b.zone
        subnet_id = yandex_vpc_subnet.public-b.id
      }
      location {
        zone      = yandex_vpc_subnet.public-c.zone
        subnet_id = yandex_vpc_subnet.public-c.id
      }
    }
  }

  service_account_id      = yandex_iam_service_account.k8s-user.id
  node_service_account_id = yandex_iam_service_account.k8s-user.id
  depends_on = [
    yandex_resourcemanager_folder_iam_member.editor,
    yandex_resourcemanager_folder_iam_member.images-puller
  ]

  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
}

resource "yandex_kubernetes_node_group" "ntlg-node-group" {
  cluster_id = yandex_kubernetes_cluster.k8s-regional.id
  name = "ntlg-node-group"

  instance_template {
    name       = "node-{instance.short_id}"
    platform_id = "standard-v1"

    network_interface {
      nat                = true
      subnet_ids = ["${yandex_vpc_subnet.public-b.id}"]
    }

    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      type = "network-hdd"
      size = 64
    }

    container_runtime {
      type = "containerd"
    }
  }

  scale_policy {
    auto_scale {
      min = 3
      max = 6
      initial = 3
    }
  }

  allocation_policy {
    location {
      zone = "ru-central1-b"
    }
  }
}

resource "yandex_vpc_subnet" "public-a" {
  name           = "public-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["192.168.1.0/24"]
}

resource "yandex_vpc_subnet" "public-b" {
  name           = "public-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["192.168.2.0/24"]
}

resource "yandex_vpc_subnet" "public-c" {
  name           = "public-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["192.168.3.0/24"]
}

resource "yandex_iam_service_account" "k8s-user" {
  name        = local.sa_name
  description = "K8S regional service account"
}

resource "yandex_kms_symmetric_key" "kms-key" {
  # Ключ для шифрования важной информации, такой как пароли, OAuth-токены и SSH-ключи.
  name              = "kms-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" # 1 год.
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
 # Сервисному аккаунту назначается роль "editor".
  folder_id = local.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.k8s-user.id}"
}

resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
  # Сервисному аккаунту назначается роль "container-registry.images.puller".
  folder_id = local.folder_id
  role      = "container-registry.images.puller"
  member    = "serviceAccount:${yandex_iam_service_account.k8s-user.id}"
}
