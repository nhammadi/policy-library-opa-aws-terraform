package policies.dynamodb.dynamodb_dax_enable_in_transit_encryption

import rego.v1

is_create_or_update(actions) if {
	some action in actions
	action in ["create", "update", "no-op"]
}

is_in_scope(resource, resource_type) if {
	resource.mode == "managed"
	resource.type == resource_type
	is_create_or_update(resource.change.actions)
}

deny contains msg if {
	some rs in input.plan.resource_changes
	is_in_scope(rs, "aws_dax_cluster")
	not rs.change.after.cluster_endpoint_encryption_type == "TLS"
	msg := sprintf("Enable TLS encryption for the cluster's endpoint on resource '%s'", [rs.address])
}
