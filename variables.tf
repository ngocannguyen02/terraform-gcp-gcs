# See https://www.terraform.io/docs/configuration/variables.html
variable "bucket_name" {
  description = "The name of the bucket."
}

variable "project_id" {
  description = "The ID of the project that will contain the bucket."
}

variable "bucket_label" {
  description = "Enter the ID of the application whose files will be hosted in the bucket."
}

variable "service_account" {
  description = "Service account"
}
variable "role_service_account" {
  description = "Service account role"
}

variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run."
  default     = true
}

variable "location" {
  description = "The GCS bucket location."
  default     = "northamerica-northeast1"
}

variable "storage_class" {
  description = "The Storage Class of items in the new bucket. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = "REGIONAL"
}

variable "lifecycle_versions" {
  description = "The number of versions of an object to keep in the bucket before cycling the oldest version of the object out. Defaults to 3."
  default     = "3"
}

variable "lifecycle_action_type" {
  description = "The action to take on an item in the bucket when its lifecycle has expired due to versioning constraints. Supported values include: Delete, SetStorageClass."
  default     = "Delete"
}

variable "lifecycle_action_storage_class" {
  description = "If lifecycle_action_type is set to SetStorageClass, this dictates the new storage_class of the item being cycled out. Supported values include: MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE."
  default     = ""
}
