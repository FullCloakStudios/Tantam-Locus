extends TextureProgress

var script

export(int, "hull", "armour", "shield") var healthType



func _process(delta):
	if($"/root/World/".has_node("playerShip")):
		script = $"/root/World/playerShip"
		if(healthType == 0):
			value = script.Hull
			max_value = script.Hulld
		if(healthType == 1):
			value = script.Shield
			max_value = script.Shieldd
		if(healthType == 2):
			value = script.Armour
			value = script.Armourd