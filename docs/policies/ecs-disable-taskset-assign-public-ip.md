# ECS task sets should not automatically assign public IP addresses

### Identifier

ecs-enable-container-insights

### Category

Protect > Secure network configuration > Resources not publicly accessible

### Description

This control checks whether **Amazon ECS task sets** are configured to **not assign public IPs**. Assigning public IPs to ECS tasks can expose them directly to the internet, increasing the attack surface. This is verified by ensuring that `assign_public_ip` is set to `"DISABLED"` in the `network_configuration` block of the `aws_ecs_service` or `aws_ecs_task_set` Terraform resources.

### Non Compliant Example

```hcl
resource "aws_ecs_task_set" "foo" {
    service         = aws_ecs_service.foo.id
    cluster         = aws_ecs_cluster.foo.id
    task_definition = aws_ecs_task_definition.foo.arn

    launch_type      = "FARGATE"
    network_configuration {
    assign_public_ip = true
    ...
    }
    ...
}
```

### Remediation

To fix this violation, explicitly set `assign_public_ip` to `false` in the ECS service or task set configuration:
```hcl
resource "aws_ecs_task_set" "foo" {
    service         = aws_ecs_service.foo.id
    cluster         = aws_ecs_cluster.foo.id
    task_definition = aws_ecs_task_definition.foo.arn

    launch_type      = "FARGATE"
    network_configuration {
    assign_public_ip = false
    ...
    }
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-16](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-16){:target="_blank" rel="nofollow noreferrer noopener"}
-[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_set#assign_public_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_set#assign_public_ip){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/fargate-task-networking.html){:target="_blank" rel="nofollow noreferrer noopener"}
