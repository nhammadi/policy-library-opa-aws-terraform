# Rego policy: mq-enable-auto-minor-version-upgrade
package policies.mq.enable_auto_minor_version_upgrade

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_mq_broker")
	not resource.change.after.auto_minor_version_upgrade == true
	msg := sprintf("Resource '%s' should have automatic minor version upgrade enabled", [resource.address])
}
