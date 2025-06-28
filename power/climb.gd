extends Power

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var climbing = false
var touching_ladders = 0

func _ready():
	self.name = "Climb"

func _physics_process(delta: float) -> void:
	if not climbing:
		return
	player.velocity.y = -gravity * delta
	if Input.is_action_pressed("move_top") or Input.is_action_pressed("jump"):
		player.velocity.y -= 400
	if Input.is_action_pressed("move_down"):
		player.velocity.y += 400


func activate():
	touching_ladders += 1
	player.animState = player.AnimState.CLIMBING
	climbing = true

func deactivate():
	touching_ladders -= 1
	if touching_ladders > 0:
		return
	player.animState = player.AnimState.DEFAULT
	climbing = false
