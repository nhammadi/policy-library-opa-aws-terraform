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
