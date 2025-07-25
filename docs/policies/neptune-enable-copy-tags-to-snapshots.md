# Neptune DB clusters should be configured to copy tags to snapshots

### Identifier

neptune-enable-copy-tags-to-snapshots

### Category

Identify > Inventory > Tagging

### Description

This control checks whether **Amazon Neptune** clusters have **copy tags to snapshots** enabled. When enabled, all tags from the cluster are automatically copied to any manual or automated snapshots. This helps maintain consistent metadata between the cluster and its backups, aiding in cost allocation, access control, and organization.

The setting is controlled via `copy_tags_to_snapshot = true` in the Terraform `aws_neptune_cluster` resource.

### Non Compliant Example

``` hcl
resource "aws_neptune_cluster" "foo" {
  cluster_identifier                  = "foo"
  engine                              = "neptune"
  storage_encrypted                   = true
  kms_key_arn                         = kms_key_arn
  deletion_protection                 = true
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  iam_database_authentication_enabled = true
  availability_zones                  = ["us-east-1a", "us-east-1b"]
  skip_final_snapshot                 = true
  copy_tags_to_snapshot               = false
}
```

### Remediation

To ensure tags are copied to snapshots, set `copy_tags_to_snapshot = true`:

``` hcl
resource "aws_neptune_cluster" "foo" {
  cluster_identifier                  = "foo"
  engine                              = "neptune"
  storage_encrypted                   = true
  kms_key_arn                         = kms_key_arn
  deletion_protection                 = true
  backup_retention_period             = 5
  preferred_backup_window             = "07:00-09:00"
  iam_database_authentication_enabled = true
  availability_zones                  = ["us-east-1a", "us-east-1b"]
  skip_final_snapshot                 = true
  copy_tags_to_snapshot               = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/neptune-controls.html#neptune-8](https://docs.aws.amazon.com/securityhub/latest/userguide/neptune-controls.html#neptune-8){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/neptune_cluster){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/neptune/latest/userguide/tagging.html#tagging-overview](https://docs.aws.amazon.com/neptune/latest/userguide/tagging.html#tagging-overview){:target="_blank" rel="nofollow noreferrer noopener"}
