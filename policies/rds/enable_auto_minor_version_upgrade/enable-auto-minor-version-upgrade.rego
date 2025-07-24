# Rego policy: rds-enable-auto-minor-version-upgrade
package policies.rds.enable_auto_minor_version_upgrade

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_db_instance")
	resource.change.after.auto_minor_version_upgrade == false
	msg := sprintf("Resource '%s' should have automatic minor version upgrades enabled", [resource.address])
}
