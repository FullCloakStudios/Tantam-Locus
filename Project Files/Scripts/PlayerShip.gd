extends KinematicBody2D

export(NodePath) var ship
var speed = Vector2(150,150)
var shipPos = Vector2()



var offset = Vector2()

func _ready():
	ship = get_node(ship)
	 

func _fixed_process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		offset = ship.position - get_global_mouse_position()
	else:
		offset = offset / 1.09
	var motion = offset * delta * speed
	move_and_slide(-motion)
	
func _process(delta):
	rotation = ( get_node(".").position.angle_to_point( get_global_mouse_position() ) + deg2rad(-90) )