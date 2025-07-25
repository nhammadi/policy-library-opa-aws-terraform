# Rego policy: dms-use-ssl
package policies.dms.use_ssl

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_dms_endpoint")
	not resource.change.after.ssl_mode == "require"
	msg := sprintf("Resource '%s' should use SSL", [resource.address])
}
