# Rego policy: ecs-enable-container-insights
package policies.ecs.enable_container_insights

import data.utils
import rego.v1

is_container_insights_enabled(resource) if {
	resource.change.after.setting[_].name == "containerInsights"
	resource.change.after.setting[_].value == "enabled"
}

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_ecs_cluster")
	not is_container_insights_enabled(resource)
	msg := sprintf("Resource '%s' should have Container Insights enabled", [resource.address])
}
