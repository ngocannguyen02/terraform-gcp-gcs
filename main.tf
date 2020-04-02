/****************
 Google provider
****************/
provider "google" {
  version = 3.15
}

/**********************************************
 Import the existing GCP project configuration
**********************************************/
data "google_project" "my_project" {
  project_id = var.project_id
}

/********************
 GCP bucket creation
********************/
resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  force_destroy = var.force_destroy
  location      = var.location
  project       = var.project_id
  storage_class = var.storage_class

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      num_newer_versions = var.lifecycle_versions
    }

    action {
      type          = var.lifecycle_action_type
      storage_class = var.lifecycle_action_storage_class
    }
  }

  labels = {
    bucket_label = var.bucket_label
  }
}

/*******************************************************************
 Granting role 'Storage Object Admin' to Alternate/Applicative Service Account
 See https://cloud.google.com/storage/docs/access-control/iam-roles
*******************************************************************/
resource "google_storage_bucket_iam_member" "gcs_app_storage_object_admin" {

  bucket = var.bucket_name
  member = format("serviceAccount:%s", var.service_account)
  role   = var.role_service_account

  depends_on = ["google_storage_bucket.bucket"]
}