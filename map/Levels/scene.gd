extends StaticBody2D

var player_ready_to_tp = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	GameState.player.global_position = GameState.scene_target.global_position


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
