extends KinematicBody2D

export(NodePath) var ship
var speed = Vector2(150,150)
var shipPos = Vector2()

export(String) var gunfire
var firerate = 1
var stockFirerate = 25

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
	
	fire()


func _process(delta):
	rotation = ( get_node(".").position.angle_to_point( get_global_mouse_position() ) + deg2rad(-90) )


func fire():
	if(firerate > 1):
		firerate = firerate - 1
	
	if(Input.is_mouse_button_pressed(BUTTON_RIGHT) && firerate < 2):
		firerate = stockFirerate
		var scene = load(gunfire)
		var node = scene.instance()
		node.global_position = $"./Gun".global_position
		node.global_rotation = $"./Gun".global_rotation
		$"/root/World/".add_child(node)