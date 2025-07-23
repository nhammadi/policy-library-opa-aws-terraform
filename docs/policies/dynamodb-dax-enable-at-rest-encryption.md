# Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest

### Identifier

dynamodb-dax-enable-at-rest-encryption

### Category

Protect > Data protection > Encryption of data at rest

### Description

This control checks whether an **Amazon DynamoDB Accelerator (DAX)** cluster is encrypted **at rest**, by verifying that the `server_side_encryption.enabled` is set to `true` in the Terraform configuration.

### Non Compliant Example

``` hcl
resource "aws_dax_cluster" "foo" {
  cluster_name       = "cluster-example-1"
  iam_role_arn       = data.aws_iam_role.example.arn
  node_type          = "dax.r4.large"
  replication_factor = 1
}

resource "aws_dax_cluster" "bar" {
  cluster_name       = "cluster-example-2"
  iam_role_arn       = data.aws_iam_role.example.arn
  node_type          = "dax.r4.large"
  replication_factor = 1
  server_side_encryption {
    enabled = false
  }
}
```

### Remediation

To fix this violation, set the encryption type explicitly in your Terraform configuration:
``` hcl
resource "aws_dax_cluster" "foo" {
  cluster_name       = "cluster-compliant"
  iam_role_arn       = data.aws_iam_role.example.arn
  node_type          = "dax.r4.large"
  replication_factor = 1
  server_side_encryption {
    enabled = true
  }
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/dynamodb-controls.html#dynamodb-3](https://docs.aws.amazon.com/securityhub/latest/userguide/dynamodb-controls.html#dynamodb-3){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dax_cluster){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAXEncryptionAtRest.html](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DAXEncryptionAtRest.html){:target="_blank" rel="nofollow noreferrer noopener"}