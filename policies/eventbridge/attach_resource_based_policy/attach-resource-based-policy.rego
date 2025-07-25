# Rego policy: eventbridge-attach-resource-based-policy
package policies.eventbridge.attach_resource_based_policy

import data.utils
import rego.v1

has_attached_policy(event_bus_name) if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_cloudwatch_event_bus_policy")
	resource.change.after.event_bus_name == event_bus_name
}

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_cloudwatch_event_bus")
	event_bus_name := resource.change.after.name
	not startswith(event_bus_name, "aws.partner/")
	not has_attached_policy(event_bus_name)
	msg := sprintf("Resource '%s' should have a resource-based policy attached", [resource.address])
}
