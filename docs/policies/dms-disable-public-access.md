# Database Migration Service replication instances should not be public

### Identifier

dms-disable-public-access

### Category

Protect > Secure network configuration

### Description

This control checks whether **AWS Database Migration Service (DMS)** replication instances are **not publicly accessible**. Disabling public access helps reduce exposure to the internet and lowers the risk of unauthorized access or data breaches.

DMS replication instances should reside in private subnets with controlled access via security groups and VPC configurations. In Terraform, this is enforced by setting `publicly_accessible = false` in the `aws_dms_replication_instance` resource.


### Non Compliant Example

``` hcl
resource "aws_dms_replication_instance" "foo" {
  replication_instance_class   = "dms.t2.large"
  replication_instance_id      = "dms-replication-instance"
  publicly_accessible          = true
  ...
}
```

### Remediation

To fix this violation, set `publicly_accessible = false`:

``` hcl
resource "aws_dms_replication_instance" "compliant" {
  replication_instance_class   = "dms.t2.large"
  replication_instance_id      = "dms-replication-instance"
  publicly_accessible          = false
  ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-1](https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance#publicly_accessible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_replication_instance#publicly_accessible){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Creating.html](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Creating.html){:target="_blank" rel="nofollow noreferrer noopener"}
