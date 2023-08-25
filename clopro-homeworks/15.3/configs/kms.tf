resource "yandex_kms_symmetric_key" "s3-key" {
  name              = "s3-key"
  description       = "encrypt s3 bucket"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
}
