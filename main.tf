
module "vpc" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/vpc?ref=main"

  network_name = "evaluation-vpc"
}

module "subnet" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/subnet?ref=main"

  project_id        = var.project_id
  subnet_name       = "evaluation-subnet"
  region            = var.region
  ip_cidr_range     = "10.10.0.0/24"
  network_self_link = module.vpc.network_self_link
}

module "firewall" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/firewall?ref=main"

  project_id        = var.project_id
  rule_name         = "allow-iap-ssh"
  network_self_link = module.vpc.network_self_link
  source_ranges     = ["35.235.240.0/20"]
  protocol          = "tcp"
  ports             = ["22"]
  target_tags       = ["allow-iap-ssh"]
}

module "vm_iam" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/iam?ref=main"

  project_id         = var.project_id
  service_account_id = "evaluation-vm-sa"
  display_name       = "Evaluation VM Service Account"
  roles              = []
}

module "gke_iam" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/iam?ref=main"

  project_id         = var.project_id
  service_account_id = "evaluation-gke-sa"
  display_name       = "Evaluation GKE Service Account"
  roles              = ["roles/container.nodeServiceAccount"]
}

module "compute_vm" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/compute-vm?ref=main"

  project_id            = var.project_id
  vm_name               = "evaluation-vm"
  subnet_self_link      = module.subnet.subnet_self_link
  service_account_email = module.vm_iam.service_account_email
  network_tags          = ["allow-iap-ssh", "atlantis-test"]
  zone                  = "asia-south1-a"
}

module "storage" {
  source = "git::https://github.com/shivamrajsr07/terraform-mod-rev.git//modules/storage?ref=main"

  project_id  = var.project_id
  bucket_name = "terraform-evaluation-app-bucket-2026-unique"
  location    = "ASIA-SOUTH1"
}
