extends Area2D

class_name Ladder

func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	var power = body.get_node("Power/Climb")
	if not power:
		return
	power.activate()

func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	var power = body.get_node("Power/Climb")
	if not power:
		return
	body.get_node("Power/Climb").deactivate()
	
	
