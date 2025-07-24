# AWS KMS key rotation should be enabled

### Identifier

kms-enable-key-rotation

### Category

Protect > Data protection > Encryption of data at rest

### Description

This control checks whether **AWS Key Management Service (KMS)** Customer Master Keys (CMKs) have **automatic key rotation** enabled. Enabling key rotation helps improve security by periodically rotating cryptographic keys, reducing the risk of key compromise. This is verified by ensuring that the `enable_key_rotation` attribute is set to `true` in the Terraform configuration for the `aws_kms_key` resource.

### Non Compliant Example

```hcl
resource "aws_kms_key" "foo" {
  description             = "foo"
  deletion_window_in_days = 10
}
```

### Remediation

To fix this violation, enable key rotation by setting the `enable_key_rotation` attribute to `true`:
```hcl
resource "aws_kms_key" "foo" {
  description             = "foo"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/kms-controls.html#kms-4](https://docs.aws.amazon.com/securityhub/latest/userguide/kms-controls.html#kms-4){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#enable_key_rotation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key#enable_key_rotation){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html](https://docs.aws.amazon.com/kms/latest/developerguide/rotate-keys.html){:target="_blank" rel="nofollow noreferrer noopener"}
