# Rego policy: appsync-enable-in-transit-encryption
package policies.appsync.enable_in_transit_encryption

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_appsync_api_cache")
	not resource.change.after.transit_encryption_enabled == true
	msg := sprintf("Resource '%s' should be encrypted in transit", [resource.address])
}
