extends AnimatedSprite2D



func _ready():
	check_controller()
	self.visibility_changed.connect(check_controller)


func check_controller():
	self.play("controller" if GameState.has_controller_connected() else "default")
