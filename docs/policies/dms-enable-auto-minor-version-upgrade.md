# DMS replication instances should have automatic minor version upgrade enabled

### Identifier

athena-enable-logging

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **AWS Database Migration Service (DMS)** replication instances have **automatic minor version upgrades** enabled. Enabling this feature ensures that the replication instance automatically receives the latest minor engine version updates, which include important security patches and stability improvements.

This is enforced by setting `auto_minor_version_upgrade = true` in the Terraform configuration of the `aws_dms_replication_instance` resource.

### Non Compliant Example

``` hcl
resource "aws_dms_replication_instance" "foo" {
  replication_instance_class   = "dms.t2.large"
  replication_instance_id      = "foo"
  auto_minor_version_upgrade = false
  ...
}
```

### Remediation

To fix this violation, enable automatic minor version upgrades by setting `auto_minor_version_upgrade = true`:

``` hcl
resource "aws_dms_replication_instance" "foo" {
  replication_instance_class   = "dms.t2.large"
  replication_instance_id      = "foo"
  auto_minor_version_upgrade = true
  ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-6](https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-6){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance#auto_minor_version_upgrade](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance#auto_minor_version_upgrade){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Creating.html](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Creating.html){:target="_blank" rel="nofollow noreferrer noopener"}
