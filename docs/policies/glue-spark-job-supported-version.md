# AWS Glue Spark jobs should run on supported versions of AWS Glue

### Identifier

glue-spark-job-supported-version

### Category

Identify > Vulnerability, patch, and version management

### Description

This control checks whether **AWS Glue Spark jobs** are configured to use supported and up-to-date Spark versions. Using supported versions ensures compatibility, stability, and security for your ETL workflows. This is verified by inspecting the `glue_version` attribute in the Terraform configuration for the `aws_glue_job` resource and confirming it matches one of the supported Glue Spark versions.

### Non Compliant Example

```hcl
resource "aws_glue_job" "foo" {
  name     = "foo"
  glue_version = "1.0"
  role_arn = aws_iam_role.example.arn

  command {
    script_location = "s3://glue-bucket/example.py"
  }
  ...
}
```

### Remediation

To fix this violation, update the glue_version attribute to a supported version such as "3.0", "4.0", or "5.0" depending on your requirements:

```hcl
resource "aws_glue_job" "foo" {
  name     = "foo"
  glue_version = "4.0"
  role_arn = aws_iam_role.example.arn

  command {
    script_location = "s3://glue-bucket/example.py"
  }
  ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/glue-controls.html#glue-4](https://docs.aws.amazon.com/securityhub/latest/userguide/glue-controls.html#glue-4){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job#glue_version-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_job#glue_version-1){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/glue/latest/dg/release-notes.html](https://docs.aws.amazon.com/glue/latest/dg/release-notes.html){:target="_blank" rel="nofollow noreferrer noopener"}
