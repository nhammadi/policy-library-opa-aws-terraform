# AWS AppSync API caches should be encrypted in transit

### Identifier

appsync-enable-in-transit-encryption

### Category

Protect > Data Protection > Encryption of data-in-transit

### Description

This control checks whether **AWS AppSync** API caches have **encryption in transit** enabled. Enabling encryption in transit protects data as it moves between the AppSync service and the underlying cache (ElastiCache for Redis), reducing the risk of data interception or tampering during transmission.

In Terraform, this is enforced using the `transit_encryption_enabled = true` setting in the `aws_appsync_api_cache` resource.

### Non Compliant Example

``` hcl
resource "aws_appsync_api_cache" "foo" {
  api_id                        = aws_appsync_graphql_api.foo.id
  api_caching_behavior       = "FULL_REQUEST_CACHING"
  type                       = "LARGE"
  ttl                        = 500
}
```

### Remediation

To ensure cache encryption at rest, set `transit_encryption_enabled  = true`:

``` hcl
resource "aws_appsync_api_cache" "foo" {
  api_id                        = aws_appsync_graphql_api.foo.id
  api_caching_behavior       = "FULL_REQUEST_CACHING"
  type                       = "LARGE"
  ttl                        = 500
  transit_encryption_enabled  = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-6](https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-6){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appsync_api_cache#transit_encryption_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appsync_api_cache#transit_encryption_enabled){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/appsync/latest/devguide/data-protection.html](https://docs.aws.amazon.com/appsync/latest/devguide/data-protection.html){:target="_blank" rel="nofollow noreferrer noopener"}
