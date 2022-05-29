/*****************************************
  Required terraform
 *****************************************/
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.7.0"
    }
  }
}

/*****************************************
  Required terraform
 *****************************************/
provider "google" {
  project = var.project_id
  credentials = var.credentials
}