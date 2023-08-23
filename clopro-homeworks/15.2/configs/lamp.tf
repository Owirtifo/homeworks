resource "yandex_iam_service_account" "ig-sa" {
  name        = "ig-sa"
  description = "service account to manage IG"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = local.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [
    yandex_iam_service_account.ig-sa,
  ]
}

resource "yandex_vpc_network" "netology-vpc" {
  name = "netology-vpc"
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance_group" "netology-ig" {
  name                = "ig-with-balancer"
  folder_id = local.folder_id
  service_account_id  = "${yandex_iam_service_account.ig-sa.id}"
  deletion_protection = "false"
  depends_on          = [yandex_resourcemanager_folder_iam_member.editor]
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
      }
    }

    network_interface {
      network_id = "${yandex_vpc_network.netology-vpc.id}"
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
      nat       = true
    }

    metadata = {
      user-data = "#cloud-config\nruncmd:\n  - echo '<html><h1><a href=\"https://storage.yandexcloud.net/netology-bucket/%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9-%D0%BB%D0%BE%D0%B3%D0%BE-1024x576.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=YCAJE_pRtbeUwfGuzOaLMmWj_%2F20230823%2Fru-central1%2Fs3%2Faws4_request&X-Amz-Date=20230823T123650Z&X-Amz-Expires=3600&X-Amz-Signature=8E8EB9C99C9292DF5598486391F17670139302F6E9F3E846CFC85D644ED84FF1&X-Amz-SignedHeaders=host\">Netology</a></h1></html>' > /var/www/html/index.html"
      ssh-keys = "ubuntu:${file("/root/.ssh/id_rsa.pub")}"
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "target-group-netology"
    target_group_description = "load balancer target group"
  }
}
