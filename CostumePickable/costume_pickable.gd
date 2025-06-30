class_name CostumePickable extends Area2D

@export var skin_name: String
@onready var costume = GameState.get_skin_by_name(skin_name)

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
		$AudioStreamPlayer2D.play()
		await get_tree().create_timer(0.5).timeout
		GameState.add_skin(costume.skin_name)
		GameState.player.show_key_power()
		queue_free()
