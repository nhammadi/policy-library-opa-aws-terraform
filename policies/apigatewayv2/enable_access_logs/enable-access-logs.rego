# Rego policy: apigatewayv2-enable-access-logs
package policies.apigatewayv2.enable_access_logs

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_apigatewayv2_stage")
	count(resource.change.after.access_log_settings) == 0
	msg := sprintf("Resource '%s' should have access logging enabled", [resource.address])
}
