extends Node2D

var target

func _process(delta):
	if(!target.get_ref()):
		free()
	else:
		position = target.get_ref().position