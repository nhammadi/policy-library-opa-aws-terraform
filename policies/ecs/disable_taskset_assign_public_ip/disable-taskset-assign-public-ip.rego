# Rego policy: ecs-disable-taskset-assign-public-ip
package policies.ecs.disable_taskset_assign_public_ip

import data.utils
import rego.v1

is_publicly_accessible(resource) if {
	resource.change.after.network_configuration[_].assign_public_ip == true
}

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_ecs_task_set")
	resource.change.after.launch_type == "FARGATE"
	is_publicly_accessible(resource)
	msg := sprintf("Resource '%s' should not automatically assign public IP addresses", [resource.address])
}
