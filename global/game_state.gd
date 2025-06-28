extends Node


var has_color := false
var has_sound := false

@onready var skins_list = preload("res://data/Skins.tscn").instantiate() as SkinsSet
var skins_owned: Array[SkinData]

func _ready():
	add_skin("default")

func add_skin(added_skin_name: String):
	var new_skin = skins_list.skins.filter(func (s: SkinData): return s.skin_name == added_skin_name)[0]
	if new_skin:
		skins_owned.append(new_skin)
