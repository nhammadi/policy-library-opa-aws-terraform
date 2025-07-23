# Firehose delivery streams should be encrypted at rest using AWS KMS

### Identifier

firehose-enable-server-side-encryption

### Category

Protect > Data protection > Encryption of data at rest

### Description

This control checks whether **Amazon Kinesis Data Firehose** delivery streams are encrypted **at rest**, by verifying that the `server_side_encryption` block is configured and `enabled` is set to `true` and set `kms_key_id` in the Terraform configuration for the `aws_kinesis_firehose_delivery_stream` resource.


### Non Compliant Example

```hcl
resource "aws_kinesis_firehose_delivery_stream" "foo" {
  destination = "s3"
  name        = "non-compliant"
}
```

### Remediation

To fix this violation, enable encryption at rest by setting the `encrypted` attribute to `true` and set `kms_key_id` in your Terraform configuration:

```hcl
resource "aws_kinesis_firehose_delivery_stream" "foo" {
  destination = "s3"
  name        = "compliant"
  server_side_encryption {
    enabled  = true
    key_type = "CUSTOMER_MANAGED_CMK"
    key_arn  = key_arn
  }
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/datafirehose-controls.html#datafirehose-1](https://docs.aws.amazon.com/securityhub/latest/userguide/datafirehose-controls.html#datafirehose-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/firehose/latest/dev/encryption.html](https://docs.aws.amazon.com/firehose/latest/dev/encryption.html){:target="_blank" rel="nofollow noreferrer noopener"}
