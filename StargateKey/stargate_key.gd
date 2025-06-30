extends Area2D

var active = false
var selected_skin: SkinData
@export var correct_skin: String
var is_correct = false

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
	if event.is_action_pressed("interact") and GameState.player.current_skin:
		selected_skin = GameState.player.current_skin
		$SelectedSkinSprite.texture = selected_skin.pickable_texture
		$Label.text = selected_skin.letter
		$LeverSprite.flip_h = true
		is_correct = correct_skin == selected_skin.skin_name
		$"../..".verify()
		
