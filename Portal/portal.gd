extends Area2D
class_name Portal

@export var connected_portal: Portal

func _on_body_entered(body: Node2D) -> void:
	if not body is PlayerCharacter:
		return
	if body.time_since_last_teleport > body.teleport_cooldown:
		body.time_since_last_teleport = 0.0
		body.global_position = connected_portal.global_position
