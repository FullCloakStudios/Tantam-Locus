extends Sprite

func _on_Area2D_body_entered( body ):
	if(body.addCargo("res://Prefabs/Items/TestItem.tscn")): 
		queue_free()
	else:
		pass

func _on_Area2D_area_entered( area ):
	if(area.invAdd("res://Prefabs/Items/TestItem.tscn")):
		queue_free()
	else:
		pass
