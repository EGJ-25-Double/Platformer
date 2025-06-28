extends Sprite2D


func _on_area_2d_body_entered(body):
	if body is PlayerCharacter:
		visible = false


func _on_area_2d_body_exited(body):
	if body is PlayerCharacter:
		visible = true
