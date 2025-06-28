extends Power

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	self.process_mode = PROCESS_MODE_DISABLED
	self.name = "Climb"

func _physics_process(delta: float) -> void:
	player.velocity.y = -gravity * delta
	if Input.is_action_pressed("move_top") or Input.is_action_pressed("jump"):
		player.velocity.y -= 400
	if Input.is_action_pressed("move_down"):
		player.velocity.y += 400


func activate():
	process_mode = PROCESS_MODE_INHERIT
	player.animState = player.AnimState.CLIMBING
	pass

func deactivate():
	process_mode = PROCESS_MODE_DISABLED
	player.animState = player.AnimState.DEFAULT
	pass
