class_name DoubleJumpPower extends Power

@export var max_wall_jump := 1
var current_wall_jump := 0
@onready var player = owner as PlayerCharacter

func _input(event):
		if event.is_action_pressed("jump") and not player.is_on_floor() and player.is_on_wall():
			if current_wall_jump >= max_wall_jump:
				return

			var collision = player.get_last_slide_collision()
			if not collision:
				return
			var direction = -1 if collision.get_normal().x <= 0 else 1
			current_wall_jump += 1
			player.velocity = Vector2(direction, -1) * player.jump_impulse

func _process(delta: float) -> void:
	if player.is_on_floor():
		current_wall_jump = 0
