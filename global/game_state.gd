extends Node


var has_color := false
var has_sound := false

@onready var skins_list = preload("res://data/Skins.tscn").instantiate() as SkinsSet
var skins_owned: Array[SkinData]

func _ready():
	add_skin("None")
	add_skin("SpiderMan")
	add_skin("Mickey")

func add_skin(name: String):
	var new_skin = skins_list.skins.filter(func (s: SkinData): return s.skin_name == name)[0]
	if new_skin:
		skins_owned.append(new_skin)
