extends Area2D

func invAdd(path):
	var x = load(path).instance()
	$"../".add_item(x.get_name(),x.texture, true)
	$"../../Cargo".drag.queue_free()
	$"../../Cargo".drag = null