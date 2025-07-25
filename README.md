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

- ECS clusters should use Container Insights ([docs](./docs/policies/ecs-enable-container-insights.md) | [OPA](./policies/ecs/enable_container_insights/enable-container-insights.rego))

- ECS task sets should not automatically assign public IP addresses ([docs](./docs/policies/ecs-disable-taskset-assign-public-ip.md) | [OPA](./policies/ecs/disable_taskset_assign_public_ip/disable-taskset-assign-public-ip.rego))

- ECR private repositories should have image scanning configured ([docs](./docs/policies/ecr-enable-private-image-scanning.md) | [OPA](./policies/ecr/enable_private_image_scanning/enable-private-image-scanning.rego))

- ECR repositories should have at least one lifecycle policy configured ([docs](./docs/policies/ecr-configure-private-lifecycle-policy.md) | [OPA](./policies/ecr/configure_private_lifecycle_policy/configure-private-lifecycle-policy.rego))

- Athena workgroups should have logging enabled ([docs](./docs/policies/athena-enable-logging.md) | [OPA](./policies/athena/enable_logging/enable-logging.rego))

- DMS replication instances should have automatic minor version upgrade enabled ([docs](./docs/policies/dms-enable-auto-minor-version-upgrade.md) | [OPA](./policies/dms/enable_auto_minor_version_upgrade/enable-auto-minor-version-upgrade.rego))

- Amazon MQ brokers should have automatic minor version upgrade enabled ([docs](./docs/policies/mq-enable-auto-minor-version-upgrade.md) | [OPA](./policies/mq/enable_auto_minor_version_upgrade/enable-auto-minor-version-upgrade.rego))

- RDS automatic minor version upgrades should be enabled ([docs](./docs/policies/rds-enable-auto-minor-version-upgrade.md) | [OPA](./policies/rds/enable_auto_minor_version_upgrade/enable-auto-minor-version-upgrade.rego))

- ElastiCache clusters should have automatic minor version upgrades enabled ([docs](./docs/policies/elasticache-enable-auto-minor-version-upgrade.md) | [OPA](./policies/elasticache/enable_auto_minor_version_upgrade/enable-auto-minor-version-upgrade.rego))

- DMS endpoints should use SSL ([docs](./docs/policies/dms-use-ssl.md) | [OPA](./policies/dms/use_ssl/use-ssl.rego))
