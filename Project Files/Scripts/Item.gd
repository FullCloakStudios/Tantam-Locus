extends Sprite

onready var ItemPath = get_filename()
var parInv

func _on_Area2D_body_entered( body ):
	if(body.has_method("addCargo")):
		if(body.addCargo(ItemPath)):
			queue_free()
		else:
			pass

func _on_Area2D_area_entered( area ):
	if(area.has_method("invAdd")):
		if(area.invAdd(ItemPath)):
			queue_free()
		else:
			pass
