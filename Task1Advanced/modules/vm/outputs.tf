output "instance_id" {
  description = "Instance id"
  value       = yandex_compute_instance.vm.id
}

output "instance_name" {
  description = "Instance name"
  value       = yandex_compute_instance.vm.name
}

output "internal_ip_address" {
  description = "Internal IP"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip_address" {
  description = "External NAT IP"
  value       = try(yandex_compute_instance.vm.network_interface[0].nat_ip_address, null)
}

output "boot_disk_id" {
  description = "Boot disk id"
  value       = yandex_compute_disk.boot.id
}
