extends KinematicBody2D

var speed = 20
var shouldMove = false
var offset = Vector2(0,0)

func _fixed_process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) && shouldMove):
		offset = position - get_global_mouse_position()
	var motion = offset * delta * speed
	move_and_slide(-motion)

func _process(delta):
	if(shouldMove):
		rotation = ( get_node(".").position.angle_to_point( get_global_mouse_position() ) + deg2rad(-90) )