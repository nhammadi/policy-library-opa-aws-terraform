# policy-library-opa-aws-terraform
Comprehensive OPA policies that can be used to establish secure Terraform configuration for Amazon Web Services infrastructure.

---

## Included Policies

- Amazon DynamoDB Accelerator Clusters should have encryption in transit enableds ([docs](./docs/policies/dynamodb-dax-enable-in-transit-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_in_transit_encryption/dynamodb-dax-enable-in-transit-encryption.rego))

- Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest ([docs](./docs/policies/dynamodb-dax-enable-at-rest-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_at_rest_encryption/dynamodb-dax-enable-at-rest-encryption.rego))

- Elastic File System should be configured to encrypt data at-rest using AWS KMS ([docs](./docs/policies/efs-enable-at-rest-encryption.md) | [OPA](./policies/efs/enable_at_rest_encryption/enable-at-rest-encryption.rego))

- Firehose delivery streams should be encrypted at rest using AWS KMS ([docs](./docs/policies/firehose-enable-server-side-encryption.md) | [OPA](./policies/firehose/enable_server_side_encryption/enable-server-side-encryption.rego))

- Access logging should be configured for API Gateway V2 Stages ([docs](./docs/policies/apigatewayv2-enable-access-logs.md) | [OPA](./policies/apigatewayv2/enable_access_logs/enable-access-logs.rego))
