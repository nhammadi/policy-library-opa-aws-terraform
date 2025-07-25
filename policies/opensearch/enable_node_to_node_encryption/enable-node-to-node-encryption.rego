# Rego policy: opensearch-enable-node-to-node-encryption
package policies.opensearch.enable_node_to_node_encryption

import data.utils
import rego.v1

is_node_to_node_encryption_enabled(resource) if {
	resource.change.after.node_to_node_encryption[_].enabled == true
}

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_opensearch_domain")

	not is_node_to_node_encryption_enabled(resource)
	msg := sprintf("Resource '%s' should encrypt data sent between nodes", [resource.address])
}
