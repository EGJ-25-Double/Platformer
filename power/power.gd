class_name Power extends Node

var player: PlayerCharacter
@export var withOwner := false


func _ready():
	if withOwner:
		set_player(owner)

func set_player(_player: PlayerCharacter):
	player = _player
