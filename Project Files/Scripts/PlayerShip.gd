extends KinematicBody2D

export(NodePath) var ship
var speed
var shipPos = Vector2()
var shouldMove = true
var movePoint = Vector2(0,0)
var touchPoint = Vector2(0,1)
var weapons = PoolStringArray()
var firerate = {}
var stockFirerate = {}
var gunnodes = {}

#var gunfire = {} <- Cursed variable do not use

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
var hullnodes = []
const HELM = 0
const CARGO = 1
const ENGINE = 2

var isCaptainFocus = false


func _ready():
	ship = get_node(ship)
	var i = 0
	var os
	for p in hullParts:
		var scene = load(p)
		var node = scene.instance()
		hullnodes.append(node)
		add_child(node)
		if(i == HELM):
			os = -64
		elif(i == CARGO):
			os = 0
		elif(i == ENGINE):
			os = 64
		i += 1
		node.position = position + Vector2(0,os)
	addGun("BasicGun", 200, "res://Prefabs/ShipParts/Weapons/BasicGun.tscn", HELM)


func _physics_process(delta):
	fire()
	damage()

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			touchPoint = ship.position - (event.position - $"/root".canvas_transform.origin)
			movePoint = (ship.position - (event.position - $"/root".canvas_transform.origin))
		else:
			movePoint = Vector2(0,0)
	if event is InputEventScreenDrag:
		movePoint = (ship.position - ((event.position + event.relative) - $"/root".canvas_transform.origin))
		touchPoint = (ship.position - ((event.position + event.relative) - $"/root".canvas_transform.origin))
func _process(delta):
	if(shouldMove && !isCaptainFocus):
		rotation = ( get_node(".").position.angle_to_point( -touchPoint + ship.position ) + deg2rad(-90) )
	move(delta)



func fire():
	for w in weapons:
		if(firerate[w] > 1):
			firerate[w] = firerate[w] - 1
		
		if(firerate[w] == 1):
			firerate[w] = stockFirerate[w]
			var gun = get_node(gunnodes[w]).get_children()
			gun[0].fire()
			

func addGun(gunname, fireratel, gunlocation, part):
	weapons.append(gunname)
	stockFirerate[gunname] = fireratel
	firerate[gunname] = fireratel
	var node = load(gunlocation)
	gunnodes[gunname] = hullnodes[part].addtohardpoint(node.instance())


func move(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT) && shouldMove && !isCaptainFocus):
		offset = movePoint
	else:
		offset = offset / 2
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
			if(rand_range(0,2) > 1):
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
