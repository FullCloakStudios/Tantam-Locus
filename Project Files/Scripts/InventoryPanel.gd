extends Area2D

var ignoreOnce = false

func invAdd(path):
	if(ignoreOnce == true):
		ignoreOnce = false
	else:
		var c = $"../"
		var x = load(path).instance()
		c.add_item(x.get_name(),x.texture, true)
		c.set_item_metadata(c.get_item_count() - 1,$"../../Cargo".drag.get_filename())
		$"../../Cargo".drag.queue_free()
		$"../../Cargo".drag = null