terraform {
  required_version = ">= 1.5.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.110.0"
    }
  }
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name        = var.vm_name
  zone           = var.zone
  platform_id    = var.platform_id
  cores          = var.cores
  memory         = var.memory
  core_fraction  = var.core_fraction
  disk_name      = var.disk_name
  disk_type      = var.disk_type
  disk_size      = var.disk_size
  subnet_id      = var.subnet_id
  nat            = var.nat
  ssh_user       = var.ssh_user
  ssh_public_key = var.ssh_public_key
  labels         = var.labels
}
