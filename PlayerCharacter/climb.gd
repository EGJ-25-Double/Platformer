extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var direction = 0.0
	$"..".velocity.y -= gravity * delta
	if Input.is_action_pressed("move_top") or Input.is_action_pressed("jump"):
		$"..".velocity.y -= 400
	if Input.is_action_pressed("move_down"):
		$"..".velocity.y += 400
		
