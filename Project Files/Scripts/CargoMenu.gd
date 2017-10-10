extends ItemList

var ship

func _ready():
	select_mode = SELECT_MULTI

func _on_Menu_about_to_show():
	ship =  $"/root/World/playerShip"
	clear()
	for i in ship.cargo:
		var x = load(i).instance()
		add_item(x.get_name(),x.texture, true)

func _on_Menu_popup_hide():
	ship.shouldMove = true
