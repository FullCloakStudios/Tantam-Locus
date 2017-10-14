extends Node2D

onready var planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
var surfaceLimit = 200
var objects = Node2D[surfaceLimit]

func _ready():
	randomize()
	$"Land".modulate = planetModulate
	var index = 0
	while(index < surfaceLimit.size()):
		#TODO Instance props randomly