extends Sprite

const base = [preload("res://Sprites/PlanetStuff/PlanetBase.png")]

const cont = [preload("res://Sprites/PlanetStuff/Cont1.png")]

#const atmo Later mabye

func _ready():
	randomize()
	texture = base[round(rand_range(0,0))] #add to this for more random
	$"PlanetCon".texture = cont[round(rand_range(0,0))]
	modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	$"PlanetCon".modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))