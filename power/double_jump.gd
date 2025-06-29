class_name DoubleJumpPower extends Power

@export var max_jump := 1
@export var jump_impulse_ratio := 1.

var current_jump := 0

func _input(event):
		if event.is_action_pressed("jump") and not player.is_on_floor():
			if current_jump >= max_jump:
				return

			current_jump += 1
			player.audio_jump.play()
			player.velocity = Vector2(0, -1) * player.jump_impulse * jump_impulse_ratio

func _process(_delta: float) -> void:
	if player.is_on_floor():
		current_jump = 0
