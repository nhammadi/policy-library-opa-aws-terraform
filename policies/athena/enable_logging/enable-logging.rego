# Rego policy: athena-enable-logging
package policies.athena.enable_logging

import data.utils
import rego.v1

is_logging_enabled(resource) if {
	some logs in resource.change.after.configuration
	logs.publish_cloudwatch_metrics_enabled == true
}

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_athena_workgroup")
	not is_logging_enabled(resource)
	msg := sprintf("Resource '%s' should have logging enabled", [resource.address])
}
