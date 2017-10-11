extends Area2D

var ignoreOnce = false

func invAdd(path):
	if(ignoreOnce == true):
		ignoreOnce = false
	else:
		var x = load(path).instance()
		$"../".add_item(x.get_name(),x.texture, true)
		$"../../Cargo".drag.queue_free()
		$"../../Cargo".drag = null