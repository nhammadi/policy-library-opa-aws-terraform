# ECR repositories should have at least one lifecycle policy configured

### Identifier

ecr-configure-private-lifecycle-policy

### Category

Identify > Resource configuration

### Description

This control checks whether **Amazon Elastic Container Registry (ECR)** private repositories have **lifecycle policies** configured. Lifecycle policies help manage image storage by automatically expiring unused or old container images. This reduces costs, improves organization, and lowers the risk of deploying outdated images. The check verifies that a `aws_ecr_lifecycle_policy` resource is associated with each `aws_ecr_repository`.

### Non Compliant Example

```hcl
resource "aws_ecr_repository" "foo" {
    name = "foo"
    image_scanning_configuration {
        scan_on_push = true
    }
}
```

### Remediation

To fix this violation, define a lifecycle policy using the `aws_ecr_lifecycle_policy` resource. For example, retain only the 10 most recent images tagged with "prod" and expire untagged images after 14 days:
```hcl
resource "aws_ecr_repository" "foo" {
    name = "foo"
    image_scanning_configuration {
        scan_on_push = true
    }
}
resource "aws_ecr_lifecycle_policy" "foo_policy" {
    repository = aws_ecr_repository.foo.name

    policy = <<EOF
    {
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": 30
            },
            "action": {
                "type": "expire"
            }
        }
    ]
    }
    EOF
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-3](https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-3){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonECR/latest/userguide/lpp_creation.html](https://docs.aws.amazon.com/AmazonECR/latest/userguide/lpp_creation.html){:target="_blank" rel="nofollow noreferrer noopener"}
