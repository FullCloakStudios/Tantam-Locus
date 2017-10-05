extends Sprite

export(float) var thrust

func _ready():
	$"../".speed = thrust 
