extends Area2D

signal trigger

@export var time := 1.0

@onready var timer = $Timer

func _ready():
	timer.wait_time = time

func _on_timer_timeout():
	trigger.emit()


func _on_body_entered(body):
	if body is PlayerCharacter:
		timer.start()
		$SailorMoonTeleportSong.play()


func _on_body_exited(body):
	if body is PlayerCharacter:
		timer.stop()
		$SailorMoonTeleportSong.stop()
