extends Area2D

func _ready():
	print("I AM AREA2D AND I AM ALIVE!")
	print("Shape active?", $CollisionShape2D.disabled == false)
	print("Shape exists?", $CollisionShape2D.shape != null)

const lines: Array[String] = [
	"Why am I still here ? Bl0££ should have teleported me back already.",
	"I have all the data we need and I am getting sick of this strange human cospl£ event or whatever it’s called. "
]

func _on_body_entered(body: Node2D) -> void:
	print("LVL 0: _on_area_2d_body_entered")
	if body is PlayerCharacter:
		DialogManager.start_dialog(global_position,lines)
