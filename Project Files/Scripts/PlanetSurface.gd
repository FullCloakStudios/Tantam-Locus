extends Node2D

onready var planetModulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
var disCheck

func _ready():
	randomize()

func _draw():
	draw_circle($captain.position, 500, planetModulate)
	disCheck = $captain.position

func _process(delta):
	if(disCheck.distance_to($captain.position) > 200):
		hide()
		show()