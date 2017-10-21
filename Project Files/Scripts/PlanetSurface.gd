extends Node2D

var planetModulate 
var disCheck
var firstPro

onready var captain = $"/root/World/playerShip/captain"

var possTerrain = [preload("res://Prefabs/TerrainTemplate.tscn")]

func _ready():
	randomize()
	planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	generate(rand_range(20,35),captain.position,100,false)
	hide()
	show()
	firstPro = true


func _draw():
	draw_circle(captain.position, 500, planetModulate)
	disCheck = captain.position

func generate(amount, pos, radi, safe):
	var index = 0
	while(index < amount):
		var terr = possTerrain[rand_range(0,0)].instance()
		terr.modulate = planetModulate
		terr.position = pos + Vector2(rand_range(-radi,radi),rand_range(-radi,radi))
		if(safe):
			terr.position * 2.5
		var sc = rand_range(terr.minScale,terr.maxScale)
		terr.scale = Vector2(sc,sc)
		terr.rotation = rand_range(0,360)
		add_child(terr)
		index += 1
		randomize()
	

func _physics_process(delta):
	if(disCheck.distance_to(captain.position) > 200):
		hide()
		show()
		generate(rand_range(40,69),captain.position,100,true)
	if(firstPro):
		var ui = load("res://Prefabs/UI.tscn").instance()
		$"/root/World".add_child(ui)
		firstPro = false
