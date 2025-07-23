package utils

is_create_or_update(actions) if {
	some action in actions
	action in ["create", "update", "no-op"]
}

is_in_scope(resource, resource_type) if {
	resource.mode == "managed"
	resource.type == resource_type
	is_create_or_update(resource.change.actions)
}
