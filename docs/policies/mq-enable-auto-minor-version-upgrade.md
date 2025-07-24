# Amazon MQ brokers should have automatic minor version upgrade enabled

### Identifier

mq-enable-auto-minor-version-upgrade

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **Amazon MQ** brokers have **automatic minor version upgrades** enabled. Enabling this feature ensures that brokers automatically receive minor software updates that include important security patches and bug fixes. Regular patching helps reduce the risk of known vulnerabilities and improves the stability of the messaging service.

This setting is controlled by `auto_minor_version_upgrade = true` in the Terraform configuration of the `aws_mq_broker` resource.

### Non Compliant Example

``` hcl
resource "aws_mq_broker" "foo" {
  broker_name        = "mq-broker"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.medium"
  ...
}
```

### Remediation

To fix this violation, enable automatic minor version upgrades by setting `auto_minor_version_upgrade = true`:

``` hcl
resource "aws_mq_broker" "foo" {
  broker_name        = "mq-broker"
  engine_type        = "ActiveMQ"
  engine_version     = "5.16.3"
  host_instance_type = "mq.t3.medium"
  auto_minor_version_upgrade = true
  ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/mq-controls.html#mq-3](https://docs.aws.amazon.com/securityhub/latest/userguide/mq-controls.html#mq-3){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#auto_minor_version_upgrade](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker#auto_minor_version_upgrade){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/upgrading-brokers.html#upgrading-brokers-automatic-upgrades](https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/upgrading-brokers.html#upgrading-brokers-automatic-upgrades){:target="_blank" rel="nofollow noreferrer noopener"}
