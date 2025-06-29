class_name SceneTeleport extends Power

func _enter_tree() -> void:
	player.set_collision_layer_value(4, true)
	player.set_collision_mask_value(4, true)
	
	
func _exit_tree() -> void:
	player.set_collision_layer_value(4, false)
	player.set_collision_mask_value(4, false)
