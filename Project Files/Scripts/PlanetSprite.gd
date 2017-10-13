extends Sprite

const base = [preload("res://Sprites/PlanetStuff/PlanetBase.png")]

const cont = [preload("res://Sprites/PlanetStuff/Cont1.png")]

#const atmo Later mabye

var x
var i = Vector2(1,1)

func _ready():
	randomize()
	texture = base[round(rand_range(0,0))] #add to this for more random
	$"PlanetCon".texture = cont[round(rand_range(0,0))]
	$"PlanetCon".rotation = rand_range(0,1)
	modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	$"PlanetCon".modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))

func _on_Area2D_body_entered( body ):
		if(body == $"/root/World/playerShip"):
			var x = $"/root/World/playerShip"
			if(!x.scale.x < 0.1):
				x.scale = i / 1.1
				i = x.scale