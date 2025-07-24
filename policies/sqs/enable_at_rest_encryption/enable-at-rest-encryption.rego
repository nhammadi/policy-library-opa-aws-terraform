# Rego policy: sqs-enable-at-rest-encryption
package policies.sqs.enable_at_rest_encryption

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_sqs_queue")
	is_null(resource.change.after.kms_master_key_id)
	msg := sprintf("Resource '%s' should be encrypted at rest", [resource.address])
}
