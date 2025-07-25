# Amazon Redshift should have automatic upgrades to major versions enabled

### Identifier

redshift-enable-version-upgrade

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **Amazon Redshift** clusters have **automatic version upgrades** enabled. Enabling automatic upgrades ensures that your Redshift clusters receive the latest minor engine version updates, which may include critical security patches, performance improvements, and bug fixes.

Automatic version upgrades help maintain the security and stability of your data warehouse with minimal administrative overhead. This is controlled using the `allow_version_upgrade = true` setting in the `aws_redshift_cluster` Terraform resource.

### Non Compliant Example

``` hcl
resource "aws_redshift_cluster" "foo" {
    cluster_identifier     = "foo"
    database_name          = "mydb"
    node_type              = "dc1.large"
    cluster_type           = "single-node"
    master_username        = "exampleuser"
    manage_master_password = true
    allow_version_upgrade  = false
    ...
}
```

### Remediation

To enable automatic minor version upgrades, set `allow_version_upgrade = true`:

``` hcl
resource "aws_redshift_cluster" "foo" {
    cluster_identifier     = "tf-redshift-cluster"
    database_name          = "mydb"
    node_type              = "dc1.large"
    cluster_type           = "single-node"
    master_username        = "exampleuser"
    manage_master_password = true
    allow_version_upgrade  = true
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-6](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-6){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster#allow_version_upgrade](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster#allow_version_upgrade){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/redshift/latest/mgmt/managing-clusters-console.html#upgrade-release-version-cluster](https://docs.aws.amazon.com/redshift/latest/mgmt/managing-clusters-console.html#upgrade-release-version-cluster){:target="_blank" rel="nofollow noreferrer noopener"}
