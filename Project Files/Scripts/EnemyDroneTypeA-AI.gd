extends KinematicBody2D

export(String) var marker
var node
var health = 100
var doSplode = true
func _ready():
	pass

func _fixed_process(delta):
	if(health <= 0):
		if(doSplode):
			doSplode = false
			var explosion = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
			explosion.translate(Vector2(rand_range(-10,10),rand_range(-10,10)))
			explosion.scale *= 2
			add_child(explosion)
			if(rand_range(0,5) > 1):
				var explosion2 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion2.translate(Vector2(rand_range(-30,30) - 5,rand_range(-20,30)))
				add_child(explosion2)
			if(rand_range(0,5) > 1):
				var explosion3 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion3.translate(Vector2(rand_range(-40,40) + 3,rand_range(-50,40) - 2))
				add_child(explosion3)

func _on_EnemyDroneTypeA_input_event( viewport, event, shape_idx ):
	if($"../Marker" == null):
		var scene = load(marker)
		var node = scene.instance()
		$"../".add_child(node)
		node.target = $"."
		node.position = position
	if($"../Marker" != null):
		$"../Marker".free()
		var scene = load(marker)
		var node = scene.instance()
		$"../".add_child(node)
		node.target = weakref($".");
		node.position = position
