resource "yandex_mdb_mysql_cluster" "net-mysql" {
  name        = "net-mysql"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.netology-vpc.id
  version     = "8.0"
  deletion_protection = false

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours   = 23
    minutes = 59
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.private-a.id
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.private-b.id
  }

  host {
    zone      = "ru-central1-c"
    subnet_id = yandex_vpc_subnet.private-c.id
  }
}

resource "yandex_mdb_mysql_database" "netology-db" {
  cluster_id = yandex_mdb_mysql_cluster.net-mysql.id
  name       = "netology-db"
}

resource "yandex_mdb_mysql_user" "ntgl-user" {
  cluster_id = yandex_mdb_mysql_cluster.net-mysql.id
  name       = "netology"
  password   = "jNUcaH33"
  permission {
    database_name = "netology-db"
    roles         = ["ALL"]
  }
}

resource "yandex_vpc_subnet" "private-a" {
  name           = "private-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["10.10.1.0/24"]
}

resource "yandex_vpc_subnet" "private-b" {
  name           = "private-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["10.10.2.0/24"]
}

resource "yandex_vpc_subnet" "private-c" {
  name           = "private-c"
  zone           = "ru-central1-c"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["10.10.3.0/24"]
}
