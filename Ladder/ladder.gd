extends Area2D

class_name Ladder

func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	if not body.has_node("Power/Climb"):
		return
	body.get_node("Power/Climb").activate()

func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	if not body.has_node("Power/Climb"):
		return
	body.get_node("Power/Climb").deactivate()
	
	
