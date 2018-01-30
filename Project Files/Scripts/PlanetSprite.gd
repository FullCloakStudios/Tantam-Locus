extends Sprite

const base = [preload("res://Sprites/PlanetStuff/PlanetBase.png")]

const cont = [preload("res://Sprites/PlanetStuff/Cont1.png")]

#const atmo Later mabye

onready var x = $"/root/World".playership
var i = Vector2(1,1)
var doLand = false
var currentScene
var resize = false

func _ready():
	randomize()
	texture = base[round(rand_range(0,0))] #add to this for more random
	$"PlanetCon".texture = cont[round(rand_range(0,0))]
	$"PlanetCon".rotation = rand_range(0,1)
	modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	$"PlanetCon".modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	currentScene = $"/root/World".get_children()


func _process(delta):
	pass



func _on_Area2D_body_entered( body ):
		if(body == $"/root/World".playership):
			doLand = true


func _on_Area2D_body_exited( body ):
		if(body == $"/root/World".playership):
			doLand = false
			resize = true