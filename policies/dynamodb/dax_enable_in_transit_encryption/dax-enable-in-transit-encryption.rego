package policies.dynamodb.dax_enable_in_transit_encryption

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_dax_cluster")
	not resource.change.after.cluster_endpoint_encryption_type == "TLS"
	msg := sprintf("Enable TLS encryption for the cluster's endpoint on resource '%s'", [resource.address])
}
