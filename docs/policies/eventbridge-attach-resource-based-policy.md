# EventBridge custom event buses should have a resource-based policy attached

### Identifier

eventbridge-attach-resource-based-policy

### Category

Protect > Secure access management > Resource not publicly accessible

### Description

This control checks whether **Amazon EventBridge** custom event buses have a **resource-based policy** attached using the `aws_cloudwatch_event_bus_policy` resource. Resource-based policies are essential for controlling who can send or receive events from your custom event bus, especially in **cross-account** scenarios.

Attaching a policy ensures that only explicitly authorized principals can interact with your event bus, helping to enforce least privilege and protect sensitive event data.

### Non Compliant Example

``` hcl
resource "aws_cloudwatch_event_bus" "foo" {
  name = "messages"
}
```

### Remediation

Use the `aws_cloudwatch_event_bus_policy` resource to attach a policy that defines access:

``` hcl
resource "aws_cloudwatch_event_bus" "foo" {
  name = "test-messages"
}

data "aws_iam_policy_document" "foo" {
  statement {
    sid    = "DevAccountAccess"
    effect = "Allow"
    actions = [
      "events:PutEvents",
    ]
    resources = [
      aws_cloudwatch_event_bus.foo.arn
    ]

    principals {
      type        = "AWS"
      identifiers = [local.account_id]
    }
  }
}

resource "aws_cloudwatch_event_bus_policy" "foo" {
  policy         = data.aws_iam_policy_document.foo.json
  event_bus_name = aws_cloudwatch_event_bus.foo.name
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/eventbridge-controls.html#eventbridge-3](https://docs.aws.amazon.com/securityhub/latest/userguide/eventbridge-controls.html#eventbridge-3){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_bus_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_bus_policy){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-perms.html#eb-event-bus-permissions-manage](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-bus-perms.html#eb-event-bus-permissions-manage){:target="_blank" rel="nofollow noreferrer noopener"}
