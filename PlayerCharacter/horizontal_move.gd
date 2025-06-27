extends Node

@onready var parent = $".."

func _process(delta: float) -> void:
	parent.position.x += 1 * 400 * delta
