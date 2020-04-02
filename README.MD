# terraform-gcp-gcs

Terraform for GCP Google Cloud Storage

## Installation

```bash
brew install terraform
export GOOGLE_CREDENTIALS=<path_to_your_serviceaccount_credentials>.json
```

Change values in test.tfvars according to your needs and environment

## Usage

```terraform
terraform validate
terraform plan -var-file=test.tfvars
terraform apply -var-file=test.tfvars
terraform destroy -var-file=test.tfvars
```

```hcl
module "gcs_bucket_example" {
  source         = "git::ssh://git@github.com:ngocannguyen02/terraform-gcp-gcs.git"
  bucket_name    = "<YOUR BUCKET NAME>" # see below for restrictions
  ...
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_label | Enter the ID of the application whose files will be hosted in the bucket. | `any` | n/a | yes |
| bucket\_name | The name of the bucket. | `any` | n/a | yes |
| force\_destroy | When deleting a bucket, this boolean option will delete all contained objects. If you try to delete a bucket that contains objects, Terraform will fail that run. | `bool` | `true` | no |
| lifecycle\_action\_storage\_class | If lifecycle\_action\_type is set to SetStorageClass, this dictates the new storage\_class of the item being cycled out. Supported values include: MULTI\_REGIONAL, REGIONAL, NEARLINE, COLDLINE. | `string` | `""` | no |
| lifecycle\_action\_type | The action to take on an item in the bucket when its lifecycle has expired due to versioning constraints. Supported values include: Delete, SetStorageClass. | `string` | `"Delete"` | no |
| lifecycle\_versions | The number of versions of an object to keep in the bucket before cycling the oldest version of the object out. Defaults to 3. | `string` | `"3"` | no |
| location | The GCS bucket location. | `string` | `"northamerica-northeast1"` | no |
| project\_id | The ID of the project that will contain the bucket. | `any` | n/a | yes |
| role\_service\_account | Service account role | `any` | n/a | yes |
| service\_account | Service account | `any` | n/a | yes |
| storage\_class | The Storage Class of items in the new bucket. Supported values include: MULTI\_REGIONAL, REGIONAL, NEARLINE, COLDLINE. | `string` | `"REGIONAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| bucket\_force\_destroy | GCS Bucket Force Destroy Flag |
| bucket\_labels | GCS Bucket Labels |
| bucket\_lifecycle\_rule | GCS Bucket Lifecycle Rules |
| bucket\_location | GCS Bucket Location |
| bucket\_name | GCS Bucket Name |
| bucket\_project\_id | GCS Bucket Project ID |
| bucket\_self\_link | GCS Bucket Self-Link |
| bucket\_storage\_class | GCS Bucket Storage Class |
| bucket\_url | GCS Bucket URL |
| bucket\_versioning | GCS Bucket Versioning |

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)