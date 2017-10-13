extends ItemList

var ship
var drag

func _on_Menu_about_to_show():
	ship =  $"/root/World/playerShip"
	clear()
	var index = 0
	for i in ship.cargo:
		var x = load(i).instance()
		add_item(x.get_name(),x.texture, true)
		set_item_metadata(index, x.get_filename())
		index += 1

func _on_Menu_popup_hide():
	ship.shouldMove = true
	if(drag != null):
		ship.addCargo(drag.get_filename())
		drag.queue_free()
		drag = null


func _process(delta):
	if(drag != null):
		drag.set_global_position(get_global_mouse_position())


func _on_Cargo_item_selected( index ):
	if(drag != null):
		drag.queue_free()
	
	$"DropArea".ignoreOnce = true
	ship.removeCargo(index)
	drag = load(get_item_metadata(index)).instance()
	$"../".add_child(drag)
	
	remove_item(index)