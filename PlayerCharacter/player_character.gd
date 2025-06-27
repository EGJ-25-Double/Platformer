extends CharacterBody2D

@export var speed = 400
@export var jump_impulse = 400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor() :
		print(is_on_floor())
		velocity.y = -jump_impulse

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("move_left"):
		velocity.x += -1  * speed
	if Input.is_action_pressed("move_right"):
		velocity.x += 1 * speed
	move_and_slide()
