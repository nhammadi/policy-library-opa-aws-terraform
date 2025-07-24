# Rego policy: kinesis-enable-server-side-encryption
package policies.kinesis.enable_server_side_encryption

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_kinesis_stream")
	is_null(resource.change.after.kms_key_id)
	msg := sprintf("Resource '%s' should be encrypted at rest", [resource.address])
}
