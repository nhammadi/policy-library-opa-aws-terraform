package policies.firehose.enable_server_side_encryption

import data.utils
import rego.v1

is_server_side_encryption_enabled(resource) if {
	key_arn := resource.change.after.server_side_encryption[_].key_arn
	resource.change.after.server_side_encryption[_].enabled == true
	resource.change.after.server_side_encryption[_].key_type == "CUSTOMER_MANAGED_CMK"
	not is_null(key_arn)
	not key_arn == ""
	startswith(key_arn, "arn:aws:kms:")
} else if {
	some kinesis_config in resource.change.after.kinesis_source_configuration
	stream_arn := kinesis_config.kinesis_stream_arn
	startswith(stream_arn, "arn:aws:kinesis:")
	role := kinesis_config.role_arn
	startswith(role, "arn:aws:iam:")
}

deny contains msg if {
	some resource in input.plan.resource_changes
	utils.is_in_scope(resource, "aws_kinesis_firehose_delivery_stream")
	not is_server_side_encryption_enabled(resource)
	msg := sprintf("Configure server side encryption for resource '%s'", [resource.address])
}
