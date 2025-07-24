# Rego policy: stepfunction-enable-logging
package policies.stepfunction.enable_logging

import data.utils
import rego.v1

sfn_logging_check(config) if {
	config.level != "OFF"
	not is_null(config.level)
}

is_logging_configuration_specified(resource) if {
	not is_null(resource.change.after.logging_configuration)
	is_array(resource.change.after.logging_configuration)
	some config in resource.change.after.logging_configuration
	sfn_logging_check(config)
}

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_sfn_state_machine")
	not is_logging_configuration_specified(resource)
	msg := sprintf("Resource '%s' should have logging turned on", [resource.address])
}
