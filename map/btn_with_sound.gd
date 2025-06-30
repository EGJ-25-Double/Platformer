extends Button
@onready var click_player = $ClickPlayer
@onready var hover_player = $HoverPlayer


func _on_focus_entered():
	hover_player.play()


func _on_mouse_entered():
	hover_player.play()


func _on_pressed():
	click_player.play()
