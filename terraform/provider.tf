# Provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id  = "b1g2fffomokflpsrefif"
  folder_id = "b1gse6fjmhipl4je57pj"
}
