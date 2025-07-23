# policy-library-opa-aws-terraform
Comprehensive OPA policies that can be used to establish secure Terraform configuration for Amazon Web Services infrastructure.

---

## Included Policies

- Amazon DynamoDB Accelerator Clusters should have encryption in transit enableds ([docs](./docs/policies/dynamodb-dax-enable-in-transit-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_in_transit_encryption/dynamodb-dax-enable-in-transit-encryption.rego))

- Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest ([docs](./docs/policies/dynamodb-dax-enable-at-rest-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_at_rest_encryption/dynamodb-dax-enable-at-rest-encryption.rego))
