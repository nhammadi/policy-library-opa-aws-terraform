policy "dynamodb-dax-enable-in-transit-encryption" {
  query = "data.policies.dynamodb.dynamodb_dax_enable_in_transit_encryption.deny"
  description = "Amazon DynamoDB Accelerator Clusters should have encryption in transit enabled"
  enforcement_level = "advisory"
}