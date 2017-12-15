extends Node2D

var planetModulate
var disCheck
var firstPro

onready var captain = $"/root/World/playerShip/captain"

var possTerrain = [preload("res://Prefabs/TerrainTemplate.tscn")]

func _ready():
	randomize()
	hide()
	show()
	firstPro = true

func _physics_process(delta):
	pass


func _draw():
	pass

func generate(amount, pos, radi, safe):
	pass