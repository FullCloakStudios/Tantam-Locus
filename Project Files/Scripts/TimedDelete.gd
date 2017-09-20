extends Timer

func _process(delta):
	if(get_time_left() < 1):
		get_parent().free()