# Rego policy: redshift-enable-version-upgrade
package policies.redshift.enable_version_upgrade

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_redshift_cluster")
	resource.change.after.allow_version_upgrade == false
	msg := sprintf("Resource '%s' should have automatic upgrades to major versions enabled", [resource.address])
}
