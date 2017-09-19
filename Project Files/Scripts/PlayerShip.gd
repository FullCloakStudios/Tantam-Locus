extends KinematicBody2D

export(NodePath) var ship
export(String) var gunfire

var speed = Vector2(150,150)
var shipPos = Vector2()



var offset = Vector2()

func _ready():
	ship = get_node(ship)
	 

func _fixed_process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		offset = ship.position - get_global_mouse_position()
	else:
		offset = offset / 1.2
	var motion = offset * delta * speed
	move_and_slide(-motion)
	
func _process(delta):
	get_node(".").rotation = ( get_node(".").position.angle_to_point( get_global_mouse_position() ) + deg2rad(-90) )
	
	if(Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		var scene = load(gunfire)
		var node = scene.instance()
		node.position = Vector2(0,1)
		add_child(node)