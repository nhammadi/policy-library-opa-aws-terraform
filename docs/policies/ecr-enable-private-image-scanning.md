# ECR private repositories should have image scanning configured

### Identifier

ecr-enable-private-image-scanning

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **Amazon Elastic Container Registry (ECR)** private repositories have **enhanced image scanning** enabled. Enhanced scanning allows for deeper vulnerability analysis using Amazon Inspector. This ensures container images are continuously monitored for known security issues. The check verifies that `image_scanning_configuration.scan_on_push` is set to `true` in the Terraform configuration for the `aws_ecr_repository` resource.

### Non Compliant Example

```hcl
resource "aws_ecr_repository" "foo" {
    name = "foo"
    ...
}
```

### Remediation

To fix this violation, enable enhanced image scanning by setting `scan_on_push = true`:
```hcl
resource "aws_ecr_repository" "foo" {
    name = "foo"
    image_scanning_configuration {
        scan_on_push = true
    }
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-1](https://docs.aws.amazon.com/securityhub/latest/userguide/ecr-controls.html#ecr-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html){:target="_blank" rel="nofollow noreferrer noopener"}
