extends Node2D

export(float) var health
var doSplode = true
export(String) var marker

func _physics_process(delta):
	if(health < 1):
		if(doSplode):
			doSplode = false
			var explosion = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
			explosion.translate(Vector2(rand_range(-10,10),rand_range(-10,10)))
			explosion.scale *= 1.3
			add_child(explosion)
			if(rand_range(0,5) > 1):
				var explosion2 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion2.translate(Vector2(rand_range(-10,10) - 5,rand_range(-10,10)))
				add_child(explosion2)
			if(rand_range(0,5) > 1):
				var explosion3 = preload("res://Prefabs/ExplosionTypeA.tscn").instance()
				explosion3.translate(Vector2(rand_range(-10,10) + 3,rand_range(-10,10) - 2))
				add_child(explosion3)

func _on_AstroidTypeA_input_event( viewport, event, shape_idx ):
	if($"/root/World/Marker" == null):
		var scene = load(marker)
		var node = scene.instance()
		$"/root/World/".add_child(node)
		node.target = $"."
		node.position = position
	if($"/root/World/Marker" != null):
		$"/root/World/Marker".free()
		var scene = load(marker)
		var node = scene.instance()
		$"/root/World/".add_child(node)
		node.target = weakref($".");
		node.position = position