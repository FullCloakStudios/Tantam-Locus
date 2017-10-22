extends KinematicBody2D

onready var player = $"/root/World/playerShip" 
var health
var route = Vector2(rand_range(-1,1),rand_range(-1,1))
var move
var speed = 200

func _physics_process(delta):
	if(player.position.distance_to(position) > 300):
		rotation = ($".".position.angle_to_point( position - route ) + deg2rad(-90) )
		move = route * speed
		move_and_slide(-move)
	else:
		move = player.position
		print (move)
		rotation = ($".".position.angle_to_point( player.position ) + deg2rad(-90) )
		move = move * speed
		move_and_slide(move)