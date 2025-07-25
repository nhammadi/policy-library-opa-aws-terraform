# Amazon Redshift clusters should prohibit public access

### Identifier

redshift-disable-public-access

### Category

Protect > Secure network configuration > Resources not publicly accessible

### Description

This control checks whether **Amazon Redshift** clusters are **not publicly accessible**. Disabling public access helps ensure that your data warehouse is only accessible from within a secure and trusted network, thereby reducing the risk of unauthorized access and data breaches.

In Terraform, this is controlled by setting `publicly_accessible = false` in the `aws_redshift_cluster` resource. When `publicly_accessible` is set to `true`, the cluster receives a public IP address and can be accessed from outside the VPC, which is not recommended unless explicitly required and tightly controlled.


### Non Compliant Example

``` hcl
resource "aws_redshift_cluster" "foo" {
    cluster_identifier      = "foo"
    database_name           = "mydb"
    master_username         = "exampleuser"
    manage_master_password  = true
    node_type               = "dc1.large"
    cluster_type            = "single-node"
    publicly_accessible     = true
    ...
}
```

### Remediation

To fix this violation, set `publicly_accessible = false`:

``` hcl
resource "aws_redshift_cluster" "foo" {
    cluster_identifier      = "foo"
    database_name           = "mydb"
    master_username         = "exampleuser"
    manage_master_password  = true
    node_type               = "dc1.large"
    cluster_type            = "single-node"
    publicly_accessible     = false
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-1](https://docs.aws.amazon.com/securityhub/latest/userguide/redshift-controls.html#redshift-1){:target="_blank" rel="nofollow noreferrer noopener"}
-[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster#publicly_accessible](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/redshift_cluster#publicly_accessible){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/redshift/latest/mgmt/managing-clusters-console.html#modify-cluster](https://docs.aws.amazon.com/redshift/latest/mgmt/managing-clusters-console.html#modify-cluster){:target="_blank" rel="nofollow noreferrer noopener"}
