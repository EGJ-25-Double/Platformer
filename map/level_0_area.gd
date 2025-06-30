extends Area2D

const lines: Array[String] = [
	"Why am I still here ? Bl0££ should have teleported me back already.",
	"I have all the data we need and I am getting sick of this strange human cospl£ event or whatever it’s called. "
]

func _on_body_entered(body: Node2D) -> void:
	print("_on_body_entered")
	if body is PlayerCharacter:
		print("player recognized")
		DialogManager.start_dialog(global_position, lines)
