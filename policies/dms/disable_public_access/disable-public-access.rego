# Rego policy: dms-disable-public-access
package policies.dms.disable_public_access

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_dms_replication_instance")
	resource.change.after.publicly_accessible == true
	msg := sprintf("Resource '%s' should not be publicly accessible", [resource.address])
}
