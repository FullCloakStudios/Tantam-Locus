extends Node2D

var ChunkPos
const chunksize = 2048
const objs = [preload("res://Prefabs/Astroid.tscn")]
const rareobjs = [preload("res://Prefabs/Planet.tscn")]


func _ready():
	ChunkPos = $"../".worldtochunk($".".position)
	generate()

func _physics_process(delta):
	if(ChunkPos.distance_to($"../".playerchunkpos) > 1.7):
		$"../".LoadedChunks.erase(ChunkPos)
		queue_free()

func generate():
	var maxObjs = randi() % 32
	var i=0
	var node
	while i < maxObjs:
		i = i + 1
		var posx = randi() % 2049 - 1024
		var posy = randi() % 2049 - 1024
		node = objs[round(rand_range(0,0))].instance()
		node.position = Vector2(posx,posy)
		$".".add_child(node)
	if(rand_range(0,10) > 9):
		var posx = randi() % 2049 - 1024
		var posy = randi() % 2049 - 1024
		node = rareobjs[round(rand_range(0,0))].instance()
		node.position = Vector2(posx,posy)
		$".".add_child(node)
