extends KinematicBody2D

export(NodePath) var marker
export(NodePath) var ship

var speed = Vector2(150,150)
var shipPos = Vector2()

var velocity = Vector2()

var currentPos = Vector2()
var lastPos = Vector2()
var offset = Vector2()

func _ready():
	set_fixed_process(true)
	marker = get_node(marker)
	ship = get_node(ship)

func _fixed_process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		currentPos = get_local_mouse_pos()
		offset = lastPos - currentPos
		lastPos = get_local_mouse_pos()
	else:
		shipPos = ship.position
		offset = marker.position - shipPos
		var motion1 = offset * delta * speed
		move_and_slide(motion1)
	velocity = offset
	var motion = velocity * delta * speed
	move_and_slide(-motion)