# Rego policy: kms-enable-key-rotation
package policies.kms.enable_key_rotation

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_kms_key")
	resource.change.after.enable_key_rotation == false
	msg := sprintf("Resource '%s' should have key rotation enabled", [resource.address])
}
