extends Area2D

func _ready():
	print("Area2D is ready!")

func _on_body_entered(body):
	print("Something entered:", body)
