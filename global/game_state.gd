extends Node

var has_color := false
var has_sound := false

var player: PlayerCharacter

var scene_target: Node2D

var current_checkpoint: CheckPoint

@onready var skins_list = preload("res://data/Skins.tscn").instantiate() as SkinsSet
var skins_owned: Array[SkinData]

func _ready():
	add_skin("None")
	
func get_skin_by_name(skin_name: String):
	return skins_list.skins.filter(func (s: SkinData): return s.skin_name == skin_name)[0]

func add_skin(added_skin_name: String):
	var new_skin = get_skin_by_name(added_skin_name)
	if new_skin and not skins_owned.has(new_skin):
		skins_owned.append(new_skin)

func has_controller_connected() -> bool:
	for device_id in Input.get_connected_joypads():
		if Input.is_joy_known(device_id):
			return true
	return false
