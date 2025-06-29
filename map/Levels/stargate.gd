extends Node

func verify():
	var keys = $Keys.get_children()
	for key in keys:
		if not key.is_correct:
			return
	$Stargate.trigger()
	
