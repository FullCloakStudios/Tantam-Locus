extends KinematicBody2D

export(String) var marker
var health = 100
var doSplode = true
var move
var speed = 50
var player

func _ready():
	player = $"/root/World".playership
	move = Vector2(rand_range(-1,1),rand_range(-1,1))
	pass

func _physics_process(delta):
	
	if(player.position.distance_to(position) > 500):
		move = position - move
		rotation = ($".".position.angle_to_point( move ) + deg2rad(90) )
		move *= delta * speed
		move_and_collide(move)
	else:
		move = position - player.position
		rotation = ($".".position.angle_to_point( move ) + deg2rad(90) )
		move *= delta * speed
		move_and_collide(move)
	
	if(health <= 0):
		if(doSplode):
			doSplode = false
			var explosion = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
			explosion.translate(Vector2(rand_range(-10,10),rand_range(-10,10)))
			explosion.scale *= 2
			add_child(explosion)
			if(rand_range(0,5) > 1):
				var explosion2 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion2.translate(Vector2(rand_range(-30,30) - 5,rand_range(-20,30)))
				add_child(explosion2)
			if(rand_range(0,5) > 1):
				var explosion3 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion3.translate(Vector2(rand_range(-40,40) + 3,rand_range(-50,40) - 2))
				add_child(explosion3)

func _on_EnemyDroneTypeA_input_event( viewport, event, shape_idx ):
	if($"/root/World/Marker" == null):
		var scene = load(marker)
		var node = scene.instance()
		$"/root/World/".add_child(node)
		node.target = $"."
		node.position = position
	if($"/root/World/Marker" != null):
		$"/root/World/Marker".free()
		var scene = load(marker)
		var node = scene.instance()
		$"/root/World/".add_child(node)
		node.target = weakref($".");
		node.position = position