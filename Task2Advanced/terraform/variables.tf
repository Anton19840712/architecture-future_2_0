variable "yc_token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "zone" {
  type    = string
  default = "ru-central1-a"
}

variable "vm_name" {
  type    = string
  default = "future20-ci-vm"
}

variable "platform_id" {
  type    = string
  default = "standard-v3"
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 4
}

variable "core_fraction" {
  type    = number
  default = 50
}

variable "disk_name" {
  type    = string
  default = "future20-ci-disk"
}

variable "disk_type" {
  type    = string
  default = "network-ssd"
}

variable "disk_size" {
  type    = number
  default = 30
}

variable "subnet_id" {
  type = string
}

variable "nat" {
  type    = bool
  default = true
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}
variable "labels" {
  type = map(string)
  default = {
    env     = "shared"
    project = "future20"
    managed = "terraform"
  }
}
