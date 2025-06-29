class_name PlayerCharacter extends CharacterBody2D

@export var jump_impulse = 800
@export var speed = 600.0
@export var acceleration := 1800.0
@export var friction := 1200.0
@export var wall_gravity_ratio := 0.2
@onready var time_since_last_teleport = 1000.0
@onready var skin_node = %Masks
var teleport_cooldown = 5.0

@onready var anim_player: AnimationPlayer = %AnimationPlayer

enum AnimState {
	DEFAULT,
	CLIMBING,
}

var animState := AnimState.DEFAULT

@onready var sprite: Node2D = %Sprite

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = -jump_impulse


func _process(delta: float) -> void:
	time_since_last_teleport += delta

func _physics_process(delta: float) -> void:
	var direction = 0.0
	if Input.is_action_pressed("move_left"):
		direction -= 1.0
	elif Input.is_action_pressed("move_right"):
		direction += 1.0

	if direction != 0:
			velocity.x = move_toward(velocity.x, direction * speed, acceleration * delta)
	else:
			velocity.x = 0

	if not is_on_floor():
		velocity.y += gravity * (wall_gravity_ratio if is_on_wall() and velocity.y > 0 else 1) * delta
	move_and_slide()
	
	if velocity.x > 0:
		sprite.scale.x = -abs(sprite.scale.x)
	elif velocity.x < 0:
		sprite.scale.x = abs(sprite.scale.x)
