class_name PlayerCharacterAnimation extends AnimationTree

@onready var player = owner as PlayerCharacter

enum {
	IDLE,
	RUN,
	JUMP,
	HANGED,
	CLIMB,
}

var state

func _ready():
	state = IDLE


func _process(_delta):
	if player.is_on_floor():
		state = RUN if player.velocity.x else IDLE
	elif player.is_on_wall() and player.velocity.y >= 0:
		state = HANGED
	elif player.animState == player.AnimState.CLIMBING:
		if player.velocity.x:
			state = RUN
		else:
			state = CLIMB
	else:
		state = JUMP
