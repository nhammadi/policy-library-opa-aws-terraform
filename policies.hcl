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
  query = "data.policies.dynamodb.efs_enable_at_rest_encryption.deny"
  description = "Elastic File System should be configured to encrypt data at-rest using AWS KMS"
  enforcement_level = "advisory"
}
