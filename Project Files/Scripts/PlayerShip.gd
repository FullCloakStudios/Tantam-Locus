extends KinematicBody2D

export(NodePath) var ship
var speed
var shipPos = Vector2()
var shouldMove = true

export(String) var gunfire
var firerate = 1
var stockFirerate = 25

var Hull = 100
var Shield = 100
var Armour = 100

var Hulld = 100
var Shieldd = 100
var Armourd = 100

var doSplode = true

var offset = Vector2()

var cargo = PoolStringArray()
var cargoSpace
var doPickup = true
var hullParts = ["res://Prefabs/ShipParts/HelmBasic.tscn", "res://Prefabs/ShipParts/CargoBasic.tscn", "res://Prefabs/ShipParts/EngineBasic.tscn"]

var isCaptainFocus = false


func _ready():
	ship = get_node(ship)
	var i = 0
	var os
	for p in hullParts:
		var scene = load(p)
		var node = scene.instance()
		add_child(node)
		if(i == 0):
			os = -64
		elif(i == 1):
			os = 0
		elif(i == 2):
			os = 64
		i += 1
		node.position = position + Vector2(0,os)


func _physics_process(delta):
	move(delta)
	fire()
	damage()



func _process(delta):
	if(shouldMove && !isCaptainFocus):
		rotation = ( get_node(".").position.angle_to_point( get_global_mouse_position() ) + deg2rad(-90) )




func fire():
	if(firerate > 1):
		firerate = firerate - 1
	
	if(firerate < 2 && shouldFire()):
		firerate = stockFirerate
		var scene = load(gunfire)
		var node = scene.instance()
		node.global_position = $"./Gun".global_position
		node.global_rotation = $"./Gun".global_rotation
		$"/root/World/".add_child(node)


func move(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) && shouldMove && !isCaptainFocus):
		offset = ship.position - get_global_mouse_position()
	else:
		offset = offset / 1.09
		if(shouldMove == false):
			offset = Vector2(0,0)
	var motion = offset * delta * speed
	move_and_slide(-motion)


func shouldFire():
	if($"../".has_node("Marker")):
		var direction = Vector2(cos(rotation), sin(rotation))
		var vecMar = $"../Marker".position - position
		if(vecMar.dot(direction) > -20 && vecMar.dot(direction) < 20):
			return true
		else:
			return false
	else:
		return false



func damage():
	if(Hull < 1):
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


func addCargo(item):
	if(!cargo.size() > cargoSpace && doPickup):
		cargo.append(item)
		return true
	else:
		return false

func removeCargo(index):
	cargo.remove(index)

func save():
	var saveData = {
		filename = get_filename(),
		parent = get_parent().get_path(),
		posx = position.x,
		posy = position.y,
		scale = scale.x,
		rotate = rotation,
		Hull = Hull,
		Shield = Shield,
		hullParts = hullParts,
		cargo = cargo
	}
	return saveData

func switchToPerson(dir):
	print(dir)
