# ECS clusters should use Container Insights

### Identifier

ecs-enable-container-insights

### Category

Identify > Logging

### Description

This control checks whether **Amazon ECS clusters** have **Container Insights** enabled. Container Insights provides detailed monitoring and troubleshooting information for ECS clusters and services via Amazon CloudWatch. Enabling Container Insights helps improve observability and operational efficiency. This is verified by checking that `settings` include `"containerInsights": "enabled"` in the Terraform configuration for the `aws_ecs_cluster` resource.

### Non Compliant Example

```hcl
resource "aws_ecs_cluster" "foo" {
  name = "foo-cluster"
}
```

### Remediation

To fix this violation, enable Container Insights by adding the `settings` block with `containerInsights` set to `"enabled"`:
```hcl
resource "aws_ecs_cluster" "foo" {
  name = "foo-cluster"
  setting {
      name  = "containerInsights"
      value = "enabled"
  }
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-12](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-12){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#setting](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster#setting){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights.html){:target="_blank" rel="nofollow noreferrer noopener"}
