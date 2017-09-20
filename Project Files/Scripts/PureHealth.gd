extends Node

export(float) var health

func _fixed_process(delta):
	if(health < 1):
		get_node(".").free()

func hit_by_bullet():
	health = 0
