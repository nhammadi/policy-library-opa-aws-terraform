# Elastic File System should be configured to encrypt data at-rest using AWS KMS

### Identifier

efs-enable-at-rest-encryption

### Category

Protect > Data protection > Encryption of data at rest

### Description

This control checks whether an **Amazon Elastic File System (EFS)** is encrypted **at rest**, by verifying that the `encrypted` attribute is set to `true` and set `kms_key_id` in the Terraform configuration for the `aws_efs_file_system` resource.

### Non Compliant Example

```hcl
resource "aws_efs_file_system" "example" {
  creation_token = "my-efs"
  encrypted      = false
}
```

### Remediation

To fix this violation, enable encryption at rest by setting the `encrypted` attribute to `true` and set `kms_key_id` in your Terraform configuration:

```hcl
 resource "aws_efs_file_system" "good_example" {
   name       = "bar"
   encrypted  = true
   kms_key_id = "kms_key_arn"
 }
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-1](https://docs.aws.amazon.com/securityhub/latest/userguide/efs-controls.html#efs-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/efs/latest/ug/encryption.html](https://docs.aws.amazon.com/efs/latest/ug/encryption.html){:target="_blank" rel="nofollow noreferrer noopener"}
