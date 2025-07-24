# Policies Per AWS Service

### Amazon API Gateway V2
- [enable-access-logs](./policies/apigatewayv2-enable-access-logs.md) Access logging should be configured for API Gateway V2 Stages

### DynamoDB
- [enable-dax-at-rest-encryption](./policies/dynamodb-dax-enable-in-transit-encryption.md) Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest

- [enable-dax-in-transit-encryption](./policies/dynamodb-dax-enable-in-transit-encryption.md) Amazon DynamoDB Accelerator (DAX) clusters should be encrypted in transit

### Elastic File System
- [enable-at-rest-encryption](./policies/efs-enable-at-rest-encryption.md) Elastic File Systems should be configured to encrypt data at-rest using AWS KMS

### AWS Glue
- [spark-job-supported-version](./policies/glue-spark-job-supported-version.md) AWS Glue Spark jobs should run on supported versions of AWS Glue

### Kinesis Data Streams
- [enable-server-side-encryption](./policies/kinesis-enable-server-side-encryption.md) Kinesis streams should be encrypted at rest

### AWS KMS
- [enable-key-rotation](./policies/kms-enable-key-rotation.md) AWS KMS key rotation should be enabled

### Amazon Kinesis Data Firehose
- [enable-server-side-encryption](./policies/firehose-enable-server-side-encryption.md) Firehose delivery streams should be encrypted at rest using AWS KMS

### Amazon SQS
- [enable-at-rest-encryption](./policies/sqs-enable-at-rest-encryption.md) Amazon SQS queues should be encrypted at rest

### AWS Step Functions
- [enable-logging](./policies/enable-logging.md) Step Functions state machines should have logging turned on
