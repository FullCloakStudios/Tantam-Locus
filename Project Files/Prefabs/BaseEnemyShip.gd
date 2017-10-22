extends KinematicBody2D

onready var player = $"/root/World/playerShip" 
var health
var route = Vector2(rand_range(-1,1),rand_range(-1,1))
var move
var speed = 1

func _physics_process(delta):
	if(player.position.distance_to(position) > 1):
		move = position - route
		rotation = ($".".position.angle_to_point( move ) + deg2rad(90) )
		move = move + (delta * Vector2(speed,speed))
		move_and_slide(move)
	else:
		move = position - player.position
		rotation = ($".".position.angle_to_point( player.position ) + deg2rad(-90) )
		move = move + (delta * Vector2(speed,speed))
		move_and_slide(-move)