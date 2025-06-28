extends Node

@onready var player = owner as PlayerCharacter
var current_skin := 0

func _input(event):
	if event.is_action_pressed("change_skin"):
		get_next_skin()

func set_current_skin():
	for child in get_children():
		remove_child(child)
		child.queue_free()
	var current = GameState.skins_owned[current_skin]
	print(current.skin_name)
	if current and current.power:
		var node: Power = current.power.new()
		node.set_player(player)
		add_child(node)
	
	for child in player.skin_node.get_children():
		(child as Node2D).visible = false

	var skin = player.skin_node.get_node(current.skin_name)
	
	if skin:
		skin.visible = true

func get_next_skin():
	current_skin = (current_skin + 1) % len(GameState.skins_owned)
	set_current_skin()
