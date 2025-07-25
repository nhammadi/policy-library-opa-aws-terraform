# OpenSearch domains should encrypt data sent between nodes

### Identifier

opensearch-enable-node-to-node-encryption

### Category

Protect > Data Protection > Encryption of data-in-transit

### Description

This control checks whether **Amazon OpenSearch Service** domains have **node-to-node encryption** enabled. Node-to-node encryption ensures that data transmitted between the nodes within an OpenSearch cluster is encrypted using Transport Layer Security (TLS). This helps protect sensitive data in transit within the cluster.

Disabling node-to-node encryption may expose your data to potential interception or compromise within the VPC network.

In Terraform, this is configured using the `node_to_node_encryption.enabled` attribute in the `aws_opensearch_domain` resource.

### Non Compliant Example

``` hcl
resource "aws_opensearch_domain" "foo" {
    domain_name    = "foo"
    engine_version = "OpenSearch_2.11"

    cluster_config {
    instance_type = "r4.large.search"
    }
}
```

### Remediation

To enable secure communication between nodes, set `enabled = true` under `node_to_node_encryption`:

``` hcl
resource "aws_opensearch_domain" "foo" {
    domain_name    = "foo"
    engine_version = "OpenSearch_2.11"

    cluster_config {
    instance_type = "r4.large.search"
    }
    node_to_node_encryption {
        enabled = true
    }
    ...
}
```

### Extra Resources

- [https://docs.aws.amazon.com/securityhub/latest/userguide/opensearch-controls.html#opensearch-3](https://docs.aws.amazon.com/securityhub/latest/userguide/opensearch-controls.html#opensearch-3){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain){:target="_blank" rel="nofollow noreferrer noopener"}
- [https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ntn.html#enabling-ntn](https://docs.aws.amazon.com/opensearch-service/latest/developerguide/ntn.html#enabling-ntn){:target="_blank" rel="nofollow noreferrer noopener"
