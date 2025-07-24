# Step Functions state machines should have logging turned on

### Identifier

stepfunction-enable-logging

### Category

Identify > Logging

### Description

This control checks whether **AWS Step Functions** have **logging enabled** to capture execution history, errors, and performance insights. Logging provides essential observability for workflows and helps in auditing, troubleshooting, and compliance. This is verified by ensuring the `logging_configuration` block is configured in the Terraform definition of the `aws_sfn_state_machine` resource.

### Non Compliant Example

``` hcl
resource "aws_sfn_state_machine" "foo" {
  name       = "my-state-machine"
  role_arn   = aws_iam_role.state_machine_role.arn
  definition = <<EOF
{
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Succeed"
    }
  }
}
EOF
}
```

### Remediation

To fix this violation, enable logging by adding the `logging_configuration` block and specifying a valid CloudWatch Logs log group ARN:
``` hcl
resource "aws_sfn_state_machine" "foo" {
  name       = "step-function"
  role_arn   = aws_iam_role.state_machine_role.arn
  definition = <<EOF
{
  "StartAt": "HelloWorld",
  "States": {
    "HelloWorld": {
      "Type": "Succeed"
    }
  }
}
EOF
  logging_configuration {
    log_destination        = "${aws_cloudwatch_log_group.sfn_state_machine_log_group.arn}:*"
    include_execution_data = true
    level                  = "ALL"
  }
  depends_on = [aws_cloudwatch_log_group.sfn_state_machine_log_group, aws_iam_role.state_machine_role]
}

resource "aws_cloudwatch_log_group" "sfn_state_machine_log_group" {
  name              = "step-function-log-group"
  retention_in_days = 30
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/stepfunctions-controls.html#stepfunctions-1](https://docs.aws.amazon.com/securityhub/latest/userguide/stepfunctions-controls.html#stepfunctions-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/step-functions/latest/dg/cw-logs.html#monitoring-logging-configure](https://docs.aws.amazon.com/step-functions/latest/dg/cw-logs.html#monitoring-logging-configure){:target="_blank" rel="nofollow noreferrer noopener"}
