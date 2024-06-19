# terraform-gcp-migration
Migrate and manage GCP resources with Terraform HCL for streamlined cloud infrastructure automation.

This project demonstrates how to migrate existing GCP resources (a Cloud Function, a Storage Bucket with labels, and a VM instance) to Terraform, and how to manage them using Terraform HCL.

## Prerequisites

- Terraform installed: [Download Terraform](https://www.terraform.io/downloads.html)
- Google Cloud SDK installed and authenticated: [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install)

## Project Structure

- `main.tf`: Main Terraform configuration file that includes the provider and module configurations.
- `modules/`: Directory containing Terraform modules for each type of resource (Cloud Function, Compute Instance, Storage Bucket).

## Steps for Migration

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/terraform-gcp-migration.git
    cd terraform-gcp-migration
    ```

2. **Configure Terraform provider** in `main.tf`:
    ```hcl
    provider "google" {
      project = "your-project-id"
      region  = "your-region"
    }
    ```

3. **Write module configurations** for each resource in `main.tf`:
    ```hcl
    module "cloud_function" {
      source = "./modules/cloud_function"
    }

    module "compute_instance" {
      source = "./modules/compute_instance"
    }

    module "storage_bucket" {
      source = "./modules/storage_bucket"
    }
    ```

4. **Import existing resources** into Terraform state:
    ```sh
    terraform init

    # Import Cloud Function
    terraform import module.cloud_function.google_cloudfunctions_function.function your-cloud-function-name

    # Import Compute Instance
    terraform import module.compute_instance.google_compute_instance.instance projects/your-project-id/zones/your-zone/instances/your-instance-name

    # Import Storage Bucket
    terraform import module.storage_bucket.google_storage_bucket.bucket your-bucket-name
    ```

5. **Verify the imported configuration**:
    ```sh
    terraform plan
    ```

6. **Apply the Terraform configuration**:
    ```sh
    terraform apply
    ```

## Managing Resources

- **To create a new resource**: Add the resource configuration to the appropriate module and run `terraform apply`.
- **To delete a resource**: Remove the resource configuration from the module and run `terraform apply`.

## Example Configuration Files

### `main.tf`
```hcl
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
