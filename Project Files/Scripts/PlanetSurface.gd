extends Node2D

var planetModulate 
var disCheck

var posArray = PoolVector2Array()
var objArray = PoolStringArray()
var possTerrain = [preload("res://Sprites/Tileset2.png"),preload("res://Sprites/Tileset3.png")]

func _ready():
	randomize()
	planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))

func _draw():
	draw_circle($captain.position, 500, planetModulate)
	disCheck = $captain.position

func generate(pos, radi):
	var terr = load("res://Prefabs/Terrain.tscn").instance()
	terr.texture = possTerrain[rand_range(0,1)]
	terr.modulate = planetModulate
	terr.position = pos + Vector2(rand_range(-radi,radi),rand_range(-radi,radi))
	add_child(terr)
	

func _process(delta):
	if(disCheck.distance_to($captain.position) > 200):
		hide()
		show()
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)
		generate($captain.position,10)