terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  folder_id = "b1gin4jp3jt08rq6tee1"
}

provider "yandex" {
  zone = "ru-central1-a"
}

resource "yandex_vpc_network" "netology-vpc" {
  name = "netology-vpc"
}
