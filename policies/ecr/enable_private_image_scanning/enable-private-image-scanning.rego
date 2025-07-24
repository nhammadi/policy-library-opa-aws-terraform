# Rego policy: ecr-enable-private-image-scanning
package policies.ecr.enable_private_image_scanning

import data.utils
import rego.v1

is_scan_on_push_enabled(resource) if {
	resource.change.after.image_scanning_configuration[_].scan_on_push == true
}

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_ecr_repository")
	not is_scan_on_push_enabled(resource)
	msg := sprintf("Resource '%s' should have image scanning configured", [resource.address])
}
