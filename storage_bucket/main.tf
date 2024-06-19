resource "google_storage_bucket" "bucket" {
  name          = "your-bucket-name"
  location      = "US"
  force_destroy = true

  labels = {
    environment = "production"
    team        = "devops"
  }
}
