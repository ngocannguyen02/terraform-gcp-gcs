# See https://www.terraform.io/docs/configuration/outputs.html

output "bucket_name" {
  description = "GCS Bucket Name"
  value       = "${google_storage_bucket.bucket.name}"
}

output "bucket_force_destroy" {
  description = "GCS Bucket Force Destroy Flag"
  value       = "${google_storage_bucket.bucket.force_destroy}"
}

output "bucket_location" {
  description = "GCS Bucket Location"
  value       = "${google_storage_bucket.bucket.location}"
}

output "bucket_project_id" {
  description = "GCS Bucket Project ID"
  value       = "${google_storage_bucket.bucket.project}"
}

output "bucket_storage_class" {
  description = "GCS Bucket Storage Class"
  value       = "${google_storage_bucket.bucket.storage_class}"
}

output "bucket_versioning" {
  description = "GCS Bucket Versioning"
  value       = "${google_storage_bucket.bucket.versioning}"
}

output "bucket_lifecycle_rule" {
  description = "GCS Bucket Lifecycle Rules"
  value       = "${google_storage_bucket.bucket.lifecycle_rule}"
}

output "bucket_labels" {
  description = "GCS Bucket Labels"
  value       = "${google_storage_bucket.bucket.labels}"
}

output "bucket_self_link" {
  description = "GCS Bucket Self-Link"
  value       = "${google_storage_bucket.bucket.self_link}"
}

output "bucket_url" {
  description = "GCS Bucket URL"
  value       = "${google_storage_bucket.bucket.url}"
}