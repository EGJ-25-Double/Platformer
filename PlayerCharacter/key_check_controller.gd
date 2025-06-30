extends AnimatedSprite2D



func _ready():
	check_controller()
	self.visibility_changed.connect(check_controller)


func check_controller():
	self.play("controller" if GameState.has_controller_connected() else "default")


func _on_costume_pickable_body_entered(body):
	self.visible = true


func _on_costume_pickable_body_exited(body):
	self.visible = false
