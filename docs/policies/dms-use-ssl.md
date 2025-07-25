# DMS endpoints should use SSL

### Identifier

dms-use-ssl

### Category

Protect > Data Protection > Encryption of data-in-transit

### Description

This control checks whether **AWS Database Migration Service (DMS)** endpoints are configured to use **SSL (Secure Sockets Layer)** for encrypting data in transit between the DMS replication instance and the source or target database.

Encrypting data in transit ensures that sensitive information such as credentials, schema, and migrated data is protected from eavesdropping and man-in-the-middle attacks. The SSL configuration is specified using the `ssl_mode` attribute in the Terraform configuration of the `aws_dms_endpoint` resource.

### Non Compliant Example

``` hcl
resource "aws_dms_endpoint" "foo" {
  endpoint_id     = "foo"
  endpoint_type   = "source"
  engine_name     = "aurora"
  port            = 3306
  kms_key_arn     = "arn:aws:kms:us-east-1:123412341234:key/abcdabcd-abcd-abcd-abcd-abcdabcdabcd"
  ssl_mode        = "none"
}
```

### Remediation

To enforce secure connections, set `ssl_mode = "require"` or a stronger mode supported by your database engine:
``` hcl
resource "aws_dms_endpoint" "foo" {
  endpoint_id     = "foo"
  endpoint_type   = "source"
  engine_name     = "aurora"
  port            = 3306
  kms_key_arn     = "arn:aws:kms:us-east-1:123412341234:key/abcdabcd-abcd-abcd-abcd-abcdabcdabcd"
  ssl_mode        = "require"
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-9](https://docs.aws.amazon.com/securityhub/latest/userguide/dms-controls.html#dms-9){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint#ssl_mode](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dms_endpoint#ssl_mode){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.Creating.html](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_Endpoints.Creating.html){:target="_blank" rel="nofollow noreferrer noopener"}
