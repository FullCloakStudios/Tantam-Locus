extends Node2D

var planetModulate 
var disCheck

var possTerrain = [preload("res://Prefabs/TerrainTemplate.tscn")]

func _ready():
	randomize()
	planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	generate(rand_range(10,25),$captain.position,100,false)
	hide()
	show()

func _draw():
	draw_circle($captain.position, 500, planetModulate)
	disCheck = $captain.position

func generate(amount, pos, radi, safe):
	index = 0
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
	

func _process(delta):
	if(disCheck.distance_to($captain.position) > 200):
		hide()
		show()
		generate($captain.position,10)
