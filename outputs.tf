output "vpc_name" {
  value = module.vpc.network_name
}

output "subnet_name" {
  value = module.subnet.subnet_name
}

output "vm_name" {
  value = module.compute_vm.vm_name
}

output "vm_internal_ip" {
  value = module.compute_vm.vm_internal_ip
}

output "storage_bucket" {
  value = module.storage.bucket_name
}

output "vm_service_account_email" {
  value = module.vm_iam.service_account_email
}

output "gke_service_account_email" {
  value = module.gke_iam.service_account_email
}