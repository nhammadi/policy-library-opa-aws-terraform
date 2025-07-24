# Amazon SQS queues should be encrypted at rest

### Identifier

sqs-enable-at-rest-encryption

### Category

Protect > Data protection > Encryption of data at rest

### Description

This control checks whether **Amazon Simple Queue Service (SQS)** queues are encrypted **at rest** using AWS Key Management Service (KMS). Encryption at rest protects the contents of SQS messages while stored, ensuring data confidentiality and compliance with security policies. This is verified by ensuring the `kms_master_key_id` attribute is set in the Terraform configuration for the `aws_sqs_queue` resource.


### Non Compliant Example

```hcl
resource "aws_sqs_queue" "foo" {
    name = "foo-queue"
}
```

### Remediation

To remediate this issue, enable encryption by specifying a valid KMS key ARN in the kms_master_key_id attribute:

```hcl
resource "aws_sqs_queue" "foo" {
    name              = "foo"
    kms_master_key_id = "kms_key_arn"
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/sqs-controls.html#sqs-1](https://docs.aws.amazon.com/securityhub/latest/userguide/sqs-controls.html#sqs-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#kms_master_key_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue#kms_master_key_id){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html){:target="_blank" rel="nofollow noreferrer noopener"}
