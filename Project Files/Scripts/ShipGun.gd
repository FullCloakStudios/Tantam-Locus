extends Node

export(String) var gunfire
var firerate = 1
var stockFirerate = 25


func _fixed_process(delta):
	if(firerate > 1):
		firerate = firerate - 1
	
	if(Input.is_mouse_button_pressed(BUTTON_RIGHT) && firerate < 2):
		firerate = stockFirerate
		var scene = load(gunfire)
		var node = scene.instance()
		add_child(node)