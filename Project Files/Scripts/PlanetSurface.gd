extends Node2D

var planetModulate 
var disCheck

var posArray = PoolVector2Array()
var objArray = PoolStringArray()

func _ready():
	randomize()
	planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))

func _draw():
	draw_circle($captain.position, 500, planetModulate)
	disCheck = $captain.position

func _process(delta):
	if(disCheck.distance_to($captain.position) > 200):
		hide()
		show()