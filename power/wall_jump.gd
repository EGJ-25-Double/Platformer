class_name WallJumpPower extends Power

@export var max_wall_jump := 2
@export var jump_impulse_ratio := 1.4

var current_wall_jump := 0

func _input(event):
		if event.is_action_pressed("jump") and not player.is_on_floor() and player.is_on_wall():
			if current_wall_jump >= max_wall_jump:
				return

			var collision = player.get_last_slide_collision()
			if not collision:
				return
			var direction = -1 if collision.get_normal().x <= 0 else 1
			current_wall_jump += 1
			player.audio_jump.play()
			player.velocity = Vector2(direction * 0.75, -1) * player.jump_impulse * jump_impulse_ratio

func _process(_delta: float) -> void:
	if player.is_on_floor():
		current_wall_jump = 0
