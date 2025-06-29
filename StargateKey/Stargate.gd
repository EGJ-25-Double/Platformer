extends StaticBody2D

var player_ready_to_tp = false
var open = false

func trigger():
	open = true
	$OnSprite.visible = true
	$OffSprite.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	player_ready_to_tp = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is not PlayerCharacter:
		return
	player_ready_to_tp = false

func _input(event: InputEvent) -> void:
	if not player_ready_to_tp and not open:
		return
	if event.is_action_pressed("jump"):
		print('fini bravo') #TODO: Teleport to next level
