provider "google" {
  project = "your-project-id"
  region  = "your-region"
}

module "cloud_function" {
  source = "./modules/cloud_function"
}

module "compute_instance" {
  source = "./modules/compute_instance"
}

module "storage_bucket" {
  source = "./modules/storage_bucket"
}
