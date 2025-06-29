class_name CheckPoint extends Node2D




func _on_area_2d_body_entered(body):
	if not body is PlayerCharacter:
		return
	activate()

func activate():
	$AudioStreamPlayer2D.play(0.04)
	for other in get_tree().get_nodes_in_group("checkpoints"):
		if other == self:
			continue
		other.deactivate()
	GameState.current_checkpoint = self
	$SpriteActive.visible = true
	$SpriteDisable.visible = false

	GameState.player.show_key_checkpoint()

func deactivate():
	$SpriteActive.visible = false
	$SpriteDisable.visible = true
	pass
