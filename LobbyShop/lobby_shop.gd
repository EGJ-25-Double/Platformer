extends Area2D

var active = false

func _on_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	active = true
	
func _on_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	active = false

func _input(event: InputEvent) -> void:
	if not active:
		return
	if event.is_action_pressed("interact"):
		print("open shop!")
