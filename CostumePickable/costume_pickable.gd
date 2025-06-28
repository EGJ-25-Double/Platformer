class_name CostumePickable extends Area2D

@export var costume: SkinData

var active = false

func _ready() -> void:
	$"Sprite2D".texture = costume.pickable_texture

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
		$"/root/GameState".skins_owned.append(costume)
		queue_free()
