# RDS automatic minor version upgrades should be enabled

### Identifier

rds-enable-auto-minor-version-upgrade

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **Amazon Relational Database Service (RDS)** instances have **automatic minor version upgrades** enabled. Enabling this setting ensures that your RDS instances automatically receive minor engine version updates, which include critical security patches, bug fixes, and performance improvements.

This feature is especially important for reducing manual maintenance overhead and minimizing the risk of running outdated or vulnerable database software.

### Non Compliant Example

``` hcl
resource "aws_db_instance" "foo" {
    allocated_storage               = 10
    db_name                         = "foo"
    engine                          = "mysql"
    engine_version                  = "5.7"
    instance_class                  = "db.t3.micro"
    username                        = "foo"
    password                        = "foobarbaz"
    parameter_group_name            = "default.mysql5.7"
    auto_minor_version_upgrade      = false
}
```

### Remediation

To fix this violation, enable automatic minor version upgrades by setting `auto_minor_version_upgrade = true`:

``` hcl
resource "aws_db_instance" "foo" {
    allocated_storage               = 10
    db_name                         = "foo"
    engine                          = "mysql"
    engine_version                  = "5.7"
    instance_class                  = "db.t3.micro"
    username                        = "foo"
    password                        = "foobarbaz"
    parameter_group_name            = "default.mysql5.7"
    auto_minor_version_upgrade      = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-13](https://docs.aws.amazon.com/securityhub/latest/userguide/rds-controls.html#rds-13){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance#auto_minor_version_upgrade](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance#auto_minor_version_upgrade){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.DBInstance.Modifying.html){:target="_blank" rel="nofollow noreferrer noopener"}
