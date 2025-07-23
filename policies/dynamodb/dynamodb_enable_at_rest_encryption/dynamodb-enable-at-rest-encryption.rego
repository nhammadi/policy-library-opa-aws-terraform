# Rego policy: dynamodb-enable-at-rest-encryption
package policies.dynamodb.dynamodb_enable_at_rest_encryption

import data.utils
import rego.v1

is_server_side_encryption_enabled(resource) if {
	resource.change.after.server_side_encryption[_].enabled == true
}

deny contains msg if {
	some rs in input.plan.resource_changes
	utils.is_in_scope(rs, "aws_dax_cluster")
	not is_server_side_encryption_enabled(resource) # regal ignore:non-loop-expression
	msg := sprintf("Configure server side encryption for resource '%s'", [rs.address])
}
