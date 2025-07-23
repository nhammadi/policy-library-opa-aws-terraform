# Amazon DynamoDB Accelerator Clusters should have encryption in transit enabled

### Identifier

dynamodb-dax-enable-in-transit-encryption

### Category

Protect > Data protection > Encryption of data in transit

### Description

This control checks whether an **Amazon DynamoDB Accelerator (DAX)** cluster is encrypted **in transit**, by verifying that the `cluster_endpoint_encryption_type` is set to `"TLS"` in the Terraform configuration.

The control **fails** if:
- The `cluster_endpoint_encryption_type` attribute is missing or its value is anything other than `"TLS"`.

### Non Compliant Example

``` hcl
resource "aws_dax_cluster" "foo" {
  cluster_name       = "cluster-example-1"
  iam_role_arn       = data.aws_iam_role.example.arn
  node_type          = "dax.r4.large"
}

resource "aws_dax_cluster" "bar" {
  cluster_name       = "cluster-example-2"
  iam_role_arn       = data.aws_iam_role.example.arn
  node_type          = "dax.r4.large"
  cluster_endpoint_encryption_type = "NONE"
}
```

### Remediation

To fix this violation, set the encryption type explicitly in your Terraform configuration:

``` hcl
resource "aws_dax_cluster" "example" {
  ...
  cluster_endpoint_encryption_type = "TLS"
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/dynamodb-controls.html#dynamodb-7](https://docs.aws.amazon.com/securityhub/latest/userguide/dynamodb-controls.html#dynamodb-7){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAXEncryptionInTransit.html](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAXEncryptionInTransit.html){:target="_blank" rel="nofollow noreferrer noopener"}
