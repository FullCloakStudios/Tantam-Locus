extends Node2D

var worldseed = 0
var autosave = 10000
onready var playership = $"playerShip"
onready var captain = $"playerShip/captain"

func _ready():
	randomize()
	if(worldseed == 0):
		worldseed = rand_range(0,9) + (rand_range(0,9) * 10) + (rand_range(0,9) * 100) + (rand_range(0,9) * 1000) + (rand_range(0,9) * 10000) + (rand_range(0,9) * 100000) + (rand_range(0,9) * 1000000) + (rand_range(0,9) * 10000000) + (rand_range(0,9) * 100000000) + (rand_range(0,9) * 1000000000)

func _physics_process(delta):
	
	autosave = autosave - 1
	if(autosave < 1):
		$"SaveManager".saveGame()
		autosave = 10000

func setActive(active):
	if active == "captain":
		pass
	else:
		playership = active