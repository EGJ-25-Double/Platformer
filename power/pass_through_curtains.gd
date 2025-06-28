class_name PassThroughCurtains extends Power

func _enter_tree() -> void:
	player.set_collision_layer_value(3, false)
	player.set_collision_mask_value(3, false)
	
	
func _exit_tree() -> void:
	player.set_collision_layer_value(3, true)
	player.set_collision_mask_value(3, true)
