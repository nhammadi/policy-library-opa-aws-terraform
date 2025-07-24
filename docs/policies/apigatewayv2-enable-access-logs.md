# Access logging should be configured for API Gateway V2 Stages

### Identifier

apigatewayv2-enable-access-logs

### Category

Identify > Logging

### Description

This control checks whether **Amazon API Gateway v2** (HTTP or WebSocket APIs) has **access logging** enabled. Access logs provide visibility into client requests and help with troubleshooting, auditing, and threat detection. This is verified by ensuring the `access_log_settings` block is defined in the Terraform configuration for the `aws_apigatewayv2_stage` resource.


### Non Compliant Example

``` hcl
resource "aws_apigatewayv2_api" "foo" {
  name          = "example-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "foo" {
  api_id      = aws_apigatewayv2_api.foo.id
  name        = "dev"
  auto_deploy = true
}
```

### Remediation

To fix this violation, configure access logging by defining the access_log_settings block and specifying a valid CloudWatch Logs destination ARN and log format:

``` hcl
resource "aws_apigatewayv2_api" "foo" {
  name          = "example-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "foo" {
  api_id      = aws_apigatewayv2_api.foo.id
  name        = "dev"
  auto_deploy = true
  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.log_group.arn
    format = jsonencode({
      "requestId" : "$context.requestId",
      "ip" : "$context.identity.sourceIp",
      "requestTime" : "$context.requestTime",
      "httpMethod" : "$context.httpMethod",
      "routeKey" : "$context.routeKey",
      "status" : "$context.status",
      "protocol" : "$context.protocol",
      "responseLength" : "$context.responseLength"
    })
  }
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/apigateway-controls.html#apigateway-9](https://docs.aws.amazon.com/securityhub/latest/userguide/apigateway-controls.html#apigateway-9){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage#access_log_settings](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage#access_log_settings){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-logging.html){:target="_blank" rel="nofollow noreferrer noopener"}
