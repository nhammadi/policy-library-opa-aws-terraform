policy "dynamodb-dax-enable-in-transit-encryption" {
  query = "data.policies.dynamodb.dynamodb_dax_enable_in_transit_encryption.deny"
  description = "Amazon DynamoDB Accelerator Clusters should have encryption in transit enabled"
  enforcement_level = "advisory"
}

policy "dynamodb-dax-enable-at-rest-encryption" {
  query = "data.policies.dynamodb.dynamodb_dax_enable_at_rest_encryption.deny"
  description = "Amazon DynamoDB Accelerator (DAX) clusters should be encrypted at rest"
  enforcement_level = "advisory"
}
