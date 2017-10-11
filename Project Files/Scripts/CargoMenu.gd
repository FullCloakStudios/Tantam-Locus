extends ItemList

var ship
var drag

func _on_Menu_about_to_show():
	ship =  $"/root/World/playerShip"
	clear()
	for i in ship.cargo:
		var x = load(i).instance()
		add_item(x.get_name(),x.texture, true)


func _on_Menu_popup_hide():
	ship.shouldMove = true


func _process(delta):
	if(drag != null):
		drag.set_global_position(get_global_mouse_position())


func _on_Cargo_item_selected( index ):
	if(drag != null):
		drag.queue_free()
	remove_item(index)
	$"DropArea".ignoreOnce = true
	drag = load("res://Prefabs/Items/TestItem.tscn").instance()
	drag.texture = get_item_icon(index)
	$"../".add_child(drag)