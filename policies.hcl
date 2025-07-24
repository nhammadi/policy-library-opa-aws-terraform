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
