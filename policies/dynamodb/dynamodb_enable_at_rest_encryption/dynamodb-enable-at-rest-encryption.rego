# Rego policy: dynamodb-enable-at-rest-encryption
package policies.dynamodb.dynamodb_enable_at_rest_encryption

import data.utils
import rego.v1

deny contains msg if {
	some rs in input.plan.resource_changes
	utils.is_in_scope(rs, "aws_dax_cluster")
	some sse in rs.change.after.server_side_encryption
	not sse.enabled
	msg := sprintf("Configure server side encryption for resource '%s'", [rs.address])
}
