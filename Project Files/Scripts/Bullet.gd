extends KinematicBody2D

export(float) var damage = 10

export(Vector2) var direction

var counter = 20

func _on_collision(value):
	var collider = value.get_parent()
	if(collider.get_script() == "res://Scripts/PureHealth.gd"):
		collider.get_script().health =- damage
	get_node(".").free()

func _fixed_process(delta):
	move_and_collide(direction)