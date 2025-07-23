package policies.efs.enable_at_rest_encryption

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_efs_file_system")
	not resource.change.after.encrypted == true
	not resource.change.after.kms_key_id
	msg := sprintf("Resource '%s' should have KMS encryption enabled", [resource.address])
}
