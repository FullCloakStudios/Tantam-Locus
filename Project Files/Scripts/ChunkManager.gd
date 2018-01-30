extends Node2D

var Chunks = {}
var LoadedChunks = {}
var chunk = preload("res://Levels/Chunk.tscn")
var playerchunkpos
var lastplayerchunkpos

func _ready():
	genaround(Vector2(0,0), 1)
	lastplayerchunkpos = Vector2(0,0)

func _physics_process(delta):
	playerchunkpos = worldtochunk($"/root/World".playership.position)
	if(playerchunkpos != lastplayerchunkpos):
		genaround(playerchunkpos, 1)
		lastplayerchunkpos = playerchunkpos

func chunktoworld(chunkpos):
	return chunkpos * 2048

func worldtochunk(worldpos):
	var cpos = worldpos / 2048
	cpos.x = round(cpos.x)
	cpos.y = round(cpos.y)
	return cpos

func loadchunk(worldpos):
	var node = chunk.instance()
	node.set_name("Chunk" + String(worldtochunk(worldpos)))
	node.position = worldpos
	$"/root/World/ChunkManager".add_child(node)
	LoadedChunks[worldtochunk(worldpos)] = node.get_name()

func genaround(chunkpos, radi):
	var x = radi
	var y = radi
	while x >= -radi:
		while y >= -radi:
			if(!LoadedChunks.has(Vector2(chunkpos.x + x,chunkpos.y + y))):
				loadchunk(chunktoworld(Vector2(chunkpos.x + x,chunkpos.y + y)))
			y = y - 1
		x = x - 1
		y = radi