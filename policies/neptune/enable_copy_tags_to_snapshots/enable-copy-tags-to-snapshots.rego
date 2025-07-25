# Rego policy: neptune-enable-copy-tags-to-snapshots
package policies.neptune.enable_copy_tags_to_snapshots

import data.utils
import rego.v1

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_neptune_cluster")
	not resource.change.after.copy_tags_to_snapshot == true
	msg := sprintf("Resource '%s' should be configured to copy tags to snapshots", [resource.address])
}
