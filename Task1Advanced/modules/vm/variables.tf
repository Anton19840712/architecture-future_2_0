variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "zone" {
  description = "YC zone"
  type        = string
}

variable "platform_id" {
  description = "YC platform id"
  type        = string
  default     = "standard-v3"
}

variable "cores" {
  description = "CPU cores"
  type        = number
}

variable "memory" {
  description = "RAM in GB"
  type        = number
}

variable "core_fraction" {
  description = "Guaranteed CPU fraction"
  type        = number
  default     = 100
}

variable "disk_name" {
  description = "Boot disk name"
  type        = string
}

variable "disk_type" {
  description = "Disk type"
  type        = string
  default     = "network-ssd"
}

variable "disk_size" {
  description = "Disk size in GB"
  type        = number
}

variable "subnet_id" {
  description = "Subnet id"
  type        = string
}

variable "nat" {
  description = "Enable NAT"
  type        = bool
  default     = true
}

variable "ssh_user" {
  description = "SSH user name"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key contents"
  type        = string
  sensitive   = true
}

variable "labels" {
  description = "Labels for YC resources"
  type        = map(string)
  default     = {}
}
