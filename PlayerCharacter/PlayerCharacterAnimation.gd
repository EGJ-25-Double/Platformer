class_name PlayerCharacterAnimation extends AnimationTree

@onready var player = owner as PlayerCharacter

enum {
	IDLE,
	RUN,
}

var state

func _ready():
	state = IDLE


func _process(delta):
	if player.is_on_floor() and player.velocity.x:
		state = RUN
	else:
		state = IDLE
