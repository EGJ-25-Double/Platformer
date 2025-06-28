extends Area2D

class_name Ladder

func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	body.get_node("Climb").process_mode = Node.PROCESS_MODE_INHERIT

func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter :
		return
	body.get_node("Climb").process_mode =  Node.PROCESS_MODE_DISABLED
	
	
