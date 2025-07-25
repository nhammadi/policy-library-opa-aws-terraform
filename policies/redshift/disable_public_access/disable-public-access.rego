# Rego policy: redshift-disable-public-access
package policies.redshift.disable_public_access

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_redshift_cluster")
	resource.change.after.publicly_accessible == true
	msg := sprintf("Resource '%s' should prohibit public access", [resource.address])
}
