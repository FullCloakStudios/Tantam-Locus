extends Node

var speed = Vector2(10,10)
export(NodePath) var marker
export(NodePath) var ship

func _ready():
	set_fixed_process(true)
	marker = get_node(marker)
	ship = get_node(ship)

func _fixed_process(delta):
	var markerPos = marker.position
	var shipPos = ship.position
	var offset = markerPos - shipPos
	var motion = offset * delta * speed
	move_and_collide(motion)