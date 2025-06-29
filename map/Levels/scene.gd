extends StaticBody2D

var player_ready_to_tp = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	player_ready_to_tp = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	player_ready_to_tp = false

func _input(event: InputEvent) -> void:
	if not player_ready_to_tp:
		return
	if event.is_action_pressed("jump"):
		GameState.player.global_position = GameState.scene_target.global_position
