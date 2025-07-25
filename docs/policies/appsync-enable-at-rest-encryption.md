# AWS AppSync API caches should be encrypted at rest

### Identifier

appsync-enable-at-rest-encryption

### Category

Protect > Data Protection > Encryption of data-at-rest

### Description

This control checks whether **AWS AppSync** API caches are configured to use **encryption at rest**. Enabling encryption at rest for AppSync API caching ensures that cached data is protected from unauthorized access while stored in memory.

AppSync API caching is backed by AWS ElastiCache for Redis. When enabled, encryption at rest can be enforced by setting the `at_rest_encryption_enabled` flag to `true` in the Terraform `aws_appsync_api_cache` resource.

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

To ensure cache encryption at rest, set `at_rest_encryption_enabled = true`:

``` hcl
resource "aws_appsync_api_cache" "foo" {
  api_id                        = aws_appsync_graphql_api.foo.id
  api_caching_behavior       = "FULL_REQUEST_CACHING"
  type                       = "LARGE"
  ttl                        = 500
  at_rest_encryption_enabled = true
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-1](https://docs.aws.amazon.com/securityhub/latest/userguide/appsync-controls.html#appsync-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appsync_api_cache#at_rest_encryption_enabled](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appsync_api_cache#at_rest_encryption_enabled){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/appsync/latest/devguide/data-protection.html](https://docs.aws.amazon.com/appsync/latest/devguide/data-protection.html){:target="_blank" rel="nofollow noreferrer noopener"}
