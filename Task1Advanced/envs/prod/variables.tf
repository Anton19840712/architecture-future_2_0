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
  type = string
}

variable "vm_name" {
  type = string
}

variable "platform_id" {
  type = string
}

variable "cores" {
  type = number
}

variable "memory" {
  type = number
}

variable "core_fraction" {
  type = number
}

variable "disk_name" {
  type = string
}

variable "disk_type" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "subnet_id" {
  type = string
}

variable "nat" {
  type = bool
}

variable "ssh_user" {
  type = string
}

variable "ssh_public_key" {
  type      = string
  sensitive = true
}

variable "labels" {
  type = map(string)
}
