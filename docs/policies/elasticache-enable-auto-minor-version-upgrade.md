# ElastiCache clusters should have automatic minor version upgrades enabled

### Identifier

elasticache-enable-auto-minor-version-upgrade

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **Amazon ElastiCache** replication groups have **automatic minor version upgrades** enabled. Enabling this setting ensures that ElastiCache nodes automatically receive minor engine version updates that contain important security patches, performance improvements, and bug fixes. Regular patching minimizes exposure to known vulnerabilities and reduces operational maintenance.

This setting is controlled using `auto_minor_version_upgrade = true` in the `aws_elasticache_replication_group` or `aws_elasticache_cluster` Terraform resource.

### Non Compliant Example

``` hcl
resource "aws_elasticache_replication_group" "foo" {
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = ["us-east-1a", "us-east-1b"]
  replication_group_id        = "group-1"
  description                 = "example description"
  node_type                   = "cache.m4.large"
  num_cache_clusters          = 2
  parameter_group_name        = "default.redis3.2"
  port                        = 6379
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = true
  auto_minor_version_upgrade  = false
}
```

### Remediation

To fix this violation, enable automatic minor version upgrades by setting `auto_minor_version_upgrade = true`:

``` hcl
resource "aws_elasticache_replication_group" "foo" {
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = ["us-east-1a", "us-east-1b"]
  replication_group_id        = "group-1"
  description                 = "example description"
  node_type                   = "cache.m4.large"
  num_cache_clusters          = 2
  parameter_group_name        = "default.redis3.2"
  port                        = 6379
  kms_key_id                  = kms_key_id
  at_rest_encryption_enabled  = true
  transit_encryption_enabled  = true
  auto_minor_version_upgrade  = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/elasticache-controls.html#elasticache-2](https://docs.aws.amazon.com/securityhub/latest/userguide/elasticache-controls.html#elasticache-2){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/VersionManagement.html](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/VersionManagement.html){:target="_blank" rel="nofollow noreferrer noopener"}
