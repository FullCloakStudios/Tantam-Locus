extends Sprite

onready var ItemPath = get_filename()

func _on_Area2D_body_entered( body ):
	if(body.addCargo(ItemPath)): 
		queue_free()
	else:
		pass

func _on_Area2D_area_entered( area ):
	if(area.invAdd(ItemPath)):
		queue_free()
	else:
		pass
