# policy-library-opa-aws-terraform
Comprehensive OPA policies that can be used to establish secure Terraform configuration for Amazon Web Services infrastructure.

---

## Included Policies

- Access logging should be configured for API Gateway V2 Stages ([docs](./docs/policies/apigatewayv2-enable-access-logs.md) | [OPA](./policies/apigatewayv2/enable_access_logs/enable-access-logs.rego))

- Amazon DynamoDB Accelerator Clusters should have encryption in transit enableds ([docs](./docs/policies/dynamodb-dax-enable-in-transit-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_in_transit_encryption/dynamodb-dax-enable-in-transit-encryption.rego))

- Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest ([docs](./docs/policies/dynamodb-dax-enable-at-rest-encryption.md) | [OPA](./policies/dynamodb/dynamodb_dax_enable_at_rest_encryption/dynamodb-dax-enable-at-rest-encryption.rego))

- Elastic File System should be configured to encrypt data at-rest using AWS KMS ([docs](./docs/policies/efs-enable-at-rest-encryption.md) | [OPA](./policies/efs/enable_at_rest_encryption/enable-at-rest-encryption.rego))

- Firehose delivery streams should be encrypted at rest using AWS KMS ([docs](./docs/policies/firehose-enable-server-side-encryption.md) | [OPA](./policies/firehose/enable_server_side_encryption/enable-server-side-encryption.rego))

- Amazon SQS queues should be encrypted at rest ([docs](./docs/policies/sqs-enable-at-rest-encryption.md) | [OPA](./policies/sqs/enable_at_rest_encryption/enable-at-rest-encryption.rego))

- Step Functions state machines should have logging turned on ([docs](./docs/policies/stepfunction-enable-logging.md) | [OPA](./policies/stepfunction/enable_logging/enable-logging.rego))

- Kinesis streams should be encrypted at rest ([docs](./docs/policies/kinesis-enable-server-side-encryption.md) | [OPA](./policies/kinesis/enable_server_side_encryption/enable-server-side-encryption.rego))

- AWS KMS key rotation should be enabled ([docs](./docs/policies/kms-enable-key-rotation.md) | [OPA](./policies/kms/enable_key_rotation/enable-key-rotation.rego))

- AWS Glue Spark jobs should run on supported versions of AWS Glue ([docs](./docs/policies/glue-spark-job-supported-version.md) | [OPA](./policies/glue/spark_job_supported_version/spark-job-supported-version.rego))
