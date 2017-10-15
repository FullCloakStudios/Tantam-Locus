extends Sprite

const base = [preload("res://Sprites/PlanetStuff/PlanetBase.png")]

const cont = [preload("res://Sprites/PlanetStuff/Cont1.png")]

#const atmo Later mabye

onready var x = $"/root/World/playerShip"
var i = Vector2(1,1)
var doLand = false
var currentScene

func _ready():
	randomize()
	texture = base[round(rand_range(0,0))] #add to this for more random
	$"PlanetCon".texture = cont[round(rand_range(0,0))]
	$"PlanetCon".rotation = rand_range(0,1)
	modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	$"PlanetCon".modulate = Color(rand_range(0,1),rand_range(0,1),rand_range(0,1))
	currentScene = $"/root".get_child($"/root".get_child_count() -1)


func _process(delta):
	if(doLand == true):
		
		if(!x.scale.x < 0.1):
			x.scale = i / 1.1
			i = x.scale
		elif(!x.scale.x > 0.8):
			x.scale = i * 1.1
			i = x.scale
		if(x.scale.x < 0.1):
			var ship = $"root/World/playerShip"
			currentScene.queue_free()
			var s = load("res://Levels/PlanetSurface.tscn")
			currentScene = s.instance()
			get_tree().get_root().add_child(currentScene)


func _on_Area2D_body_entered( body ):
		if(body == $"/root/World/playerShip"):
			doLand = true

func _on_Area2D_body_exited( body ):
		if(body == $"/root/World/playerShip"):
			doLand = false