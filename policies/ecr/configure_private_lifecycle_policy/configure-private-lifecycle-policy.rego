# Rego policy: ecr-configure-private-lifecycle-policy
package policies.ecr.configure_private_lifecycle_policy

import data.utils
import rego.v1

has_lifecycle_policy(ecr_repository_name) if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_ecr_lifecycle_policy")
	resource.change.after.repository == ecr_repository_name
}

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_ecr_repository")
	ecr_repository_name := resource.change.after.name
	not has_lifecycle_policy(ecr_repository_name)
	msg := sprintf("Resource '%s' should have at least one lifecycle policy configured", [resource.address])
}
