extends Sprite

const base = [preload("res://Sprites/PlanetStuff/PlanetBase.png")]

const cont = [preload("res://Sprites/PlanetStuff/Cont1.png")]

#const atmo Later mabye

var x
var i

func _ready():
	randomize()
	texture = base[round(rand_range(0,0))] #add to this for more random
	$"PlanetCon".texture = cont[round(rand_range(0,0))]
	$"PlanetCon".rotation = rand_range(0,1)
	modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	$"PlanetCon".modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))

func _process(delta):
	if(x != null):
		x.scale = i / 1.1
		i = x.scale
		if(i.x < 0.1):
			print("do stuff")
			x = null

func _on_Area2D_body_entered( body ):
		if(body == $"/root/World/playerShip"):
			x = body
			i = body.scale