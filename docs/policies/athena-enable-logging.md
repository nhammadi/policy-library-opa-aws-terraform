# Athena workgroups should have logging enabled

### Identifier

athena-enable-logging

### Category

Identify > Logging

### Description

This control checks whether **Amazon Athena** workgroups have **CloudWatch metrics publishing** enabled. Enabling CloudWatch metrics allows you to monitor Athena query performance and usage through metrics like `QuerySucceeded`, `QueryFailed`, and `ProcessedBytes`. This enhances observability and helps detect unusual query activity or performance issues.

### Non Compliant Example

``` hcl
resource "aws_athena_workgroup" "foo" {
    name = "foo"
    configuration {
        enforce_workgroup_configuration    = true
        publish_cloudwatch_metrics_enabled = false
    }
}
```

### Remediation

To fix this violation, enable CloudWatch metrics by setting `publish_cloudwatch_metrics_enabled = true` in the Athena workgroup configuration:

``` hcl
resource "aws_athena_workgroup" "foo" {
    name = "foo"
    configuration {
        enforce_workgroup_configuration    = true
        publish_cloudwatch_metrics_enabled = true
    }
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/athena-controls.html#athena-4](https://docs.aws.amazon.com/securityhub/latest/userguide/athena-controls.html#athena-4){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_workgroup#publish_cloudwatch_metrics_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_workgroup#publish_cloudwatch_metrics_enabled){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/athena/latest/ug/athena-cloudwatch-metrics-enable.html](https://docs.aws.amazon.com/athena/latest/ug/athena-cloudwatch-metrics-enable.html){:target="_blank" rel="nofollow noreferrer noopener"}
