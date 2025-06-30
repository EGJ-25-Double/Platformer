extends Node

@onready var player = owner as PlayerCharacter
var current_skin := 0

var PowerChange = preload("res://power/PowerChange.tscn")

func _input(event):
	if event.is_action_pressed("change_skin"):
		get_next_skin()

func set_current_skin():
	create_anim()
	player.can_move = false
	await get_tree().create_timer(0.5).timeout
	player.can_move = true
	for child in get_children():
		remove_child(child)
		child.queue_free()
	var current = GameState.skins_owned[current_skin]
	if current and current.power:
		var node: Power = current.power.new()
		node.set_player(player)
		add_child(node)
		player.current_skin = current
	
	for child in player.skin_node.get_children():
		(child as Node2D).visible = false

	var skin = player.skin_node.get_node(current.skin_name)
	
	
	if skin:
		skin.visible = true

	if player.key_power:
		player.key_power.visible = false

func get_next_skin():
	var new_skin = (current_skin + 1) % len(GameState.skins_owned)
	if current_skin == new_skin:
		return
	current_skin = new_skin
	set_current_skin()

func create_anim():
	var node = PowerChange.instantiate() as Node2D
	node.global_position = player.global_position
	get_tree().root.add_child(node)
