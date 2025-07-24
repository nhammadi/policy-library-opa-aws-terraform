# Rego policy: glue-spark-job-supported-version
package policies.glue.spark_job_supported_version

import data.utils
import rego.v1

deprecated_versions := ["1.0", "2.0"]

deny contains msg if {
	some resource in input.resource_changes
	utils.is_in_scope(resource, "aws_glue_job")
	resource.change.after.glue_version in deprecated_versions
	msg := sprintf("Resource '%s' should run on a supported glue version", [resource.address])
}
