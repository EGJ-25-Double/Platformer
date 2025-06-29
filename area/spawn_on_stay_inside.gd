extends Node2D

func _on_area_2d_trigger():
	$Boom.visible = true
	($Boom as AnimatedSprite2D).play("default")

func _on_animated_sprite_2d_2_animation_finished():
	$CostumePickable.visible = true
	$CostumePickable.process_mode = PROCESS_MODE_INHERIT
	$Boom.queue_free()


func _on_costume_pickable_tree_exited():
	queue_free()
