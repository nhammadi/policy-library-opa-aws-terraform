policy "dynamodb-dax-enable-in-transit-encryption" {
  query = "data.policies.dynamodb.dax_enable_in_transit_encryption.deny"
  description = "Amazon DynamoDB Accelerator Clusters should have encryption in transit enabled"
  enforcement_level = "advisory"
}

policy "dynamodb-dax-enable-at-rest-encryption" {
  query = "data.policies.dynamodb.dax_enable_at_rest_encryption.deny"
  description = "Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
  enforcement_level = "advisory"
}

policy "efs-enable-at-rest-encryption" {
  query = "data.policies.efs.enable_at_rest_encryption.deny"
  description = "Elastic File System should be configured to encrypt data at-rest using AWS KMS"
  enforcement_level = "advisory"
}

policy "firehose-enable-server-side-encryption" {
  query = "data.policies.firehose.enable_server_side_encryption.deny"
  description = "Firehose delivery streams should be encrypted at rest using AWS KMS"
  enforcement_level = "advisory"
}

policy "apigatewayv2-enable-access-logs" {
  query = "data.policies.apigatewayv2.enable_access_logs.deny"
  description = "Access logging should be configured for API Gateway V2 Stages"
  enforcement_level = "advisory"
}

policy "sqs-enable-at-rest-encryption" {
  query = "data.policies.sqs.enable_at_rest_encryption.deny"
  description = "Amazon SQS queues should be encrypted at rest"
  enforcement_level = "advisory"
}

policy "stepfunction-enable-logging" {
  query = "data.policies.stepfunction.enable_logging.deny"
  description = "Step Functions state machines should have logging turned on"
  enforcement_level = "advisory"
}

policy "kinesis-enable-server-side-encryption" {
  query = "data.policies.kinesis.enable_server_side_encryption.deny"
  description = "Kinesis streams should be encrypted at rest"
  enforcement_level = "advisory"
}

policy "kms-enable-key-rotation" {
  query = "data.policies.kms.enable_key_rotation.deny"
  description = "AWS KMS key rotation should be enabled"
  enforcement_level = "advisory"
}

policy "glue-spark-job-supported-version" {
  query = "data.policies.glue.spark_job_supported_version.deny"
  description = "AWS Glue Spark jobs should run on supported versions of AWS Glue"
  enforcement_level = "advisory"
}

policy "ecs-enable-container-insights" {
  query = "data.policies.ecs.enable_container_insights.deny"
  description = "ECS clusters should use Container Insights"
  enforcement_level = "advisory"
}

policy "ecs-disable-taskset-assign-public-ip" {
  query = "data.policies.ecs.disable_taskset_assign_public_ip.deny"
  description = "ECS task sets should not automatically assign public IP addresses"
  enforcement_level = "advisory"
}

policy "ecr-enable-private-image-scanning" {
  query = "data.policies.ecr.enable_private_image_scanning.deny"
  description = "ECR private repositories should have image scanning configured"
  enforcement_level = "advisory"
}

policy "ecr-configure-private-lifecycle-policy" {
  query = "data.policies.ecr.configure_private_lifecycle_policy.deny"
  description = "ECR repositories should have at least one lifecycle policy configured"
  enforcement_level = "advisory"
}

policy "athena-enable-logging" {
  query = "data.policies.athena.enable_logging.deny"
  description = "Athena workgroups should have logging enabled"
  enforcement_level = "advisory"
}

policy "dms-enable-auto-minor-version-upgrade" {
  query = "data.policies.dms.enable_auto_minor_version_upgrade.deny"
  description = "DMS replication instances should have automatic minor version upgrade enabled"
  enforcement_level = "advisory"
}

policy "mq-enable-auto-minor-version-upgrade" {
  query = "data.policies.mq.enable_auto_minor_version_upgrade.deny"
  description = "Amazon MQ brokers should have automatic minor version upgrade enabled"
  enforcement_level = "advisory"
}

policy "rds-enable-auto-minor-version-upgrade" {
  query = "data.policies.rds.enable_auto_minor_version_upgrade.deny"
  description = "RDS automatic minor version upgrades should be enabled"
  enforcement_level = "advisory"
}

policy "elasticache-enable-auto-minor-version-upgrade" {
  query = "data.policies.elasticache.enable_auto_minor_version_upgrade.deny"
  description = "ElastiCache clusters should have automatic minor version upgrades enabled"
  enforcement_level = "advisory"
}

policy "dms-use-ssl" {
  query = "data.policies.dms.use_ssl.deny"
  description = "DMS endpoints should use SSL"
  enforcement_level = "advisory"
}

policy "dms-disable-public-access" {
  query = "data.policies.dms.disable_public_access.deny"
  description = "Database Migration Service replication instances should not be public"
  enforcement_level = "advisory"
}

policy "redshift-disable-public-access" {
  query = "data.policies.redshift.disable_public_access.deny"
  description = "Amazon Redshift clusters should prohibit public access"
  enforcement_level = "advisory"
}

policy "redshift-enable-version-upgrade" {
  query = "data.policies.redshift.enable_version_upgrade.deny"
  description = "Amazon Redshift should have automatic upgrades to major versions enabled"
  enforcement_level = "advisory"
}

policy "neptune-enable-copy-tags-to-snapshots" {
  query = "data.policies.neptune.enable_copy_tags_to_snapshots.deny"
  description = "Neptune DB clusters should be configured to copy tags to snapshots"
  enforcement_level = "advisory"
}

policy "appsync-enable-at-rest-encryption" {
  query = "data.policies.appsync.enable_at_rest_encryption.deny"
  description = "AWS AppSync API caches should be encrypted at rest"
  enforcement_level = "advisory"
}

policy "appsync-enable-in-transit-encryption" {
  query = "data.policies.appsync.enable_in_transit_encryption.deny"
  description = "AWS AppSync API caches should be encrypted in transit"
  enforcement_level = "advisory"
}
