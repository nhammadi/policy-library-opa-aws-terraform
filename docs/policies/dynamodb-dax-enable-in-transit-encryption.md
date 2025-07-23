## Amazon DynamoDB Accelerator Clusters should have encryption in transit enabled

| Provider            |       Category      |
| ------------------- |  -----------------  |
| Amazon Web Services |   Data Protection   |

---

### Description

This control checks whether an **Amazon DynamoDB Accelerator (DAX)** cluster is encrypted **in transit**, by verifying that the `cluster_endpoint_encryption_type` is set to `"TLS"` in the Terraform configuration.  

The control **fails** if:
- The `cluster_endpoint_encryption_type` attribute is missing or its value is anything other than `"TLS"`.

---

### Remediation

To fix this violation, set the encryption type explicitly in your Terraform configuration:

```hcl
resource "aws_dax_cluster" "example" {
  ...
  cluster_endpoint_encryption_type = "TLS"
}

