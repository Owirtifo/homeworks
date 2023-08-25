resource "yandex_storage_bucket" "netology-tst" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = "netology-tst.gfg24.com"
  acl        = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  https {
    certificate_id = "yandex_cm_certificate.net.id"
  }
}

resource "yandex_storage_object" "index-html" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.netology-tst.id
  key        = "index.html"
  source     = "/tmp/index.html"
}

resource "yandex_storage_object" "error-html" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = yandex_storage_bucket.netology-tst.id
  key        = "error.html"
  source     = "/tmp/error.html"
}
// Добавить сертификат от Let's Encrypt
resource "yandex_cm_certificate" "net" {
  name    = "net"
  domains = ["netology-tst.gfg24.com"]

  managed {
  challenge_type = "DNS_TXT"
  }
}
