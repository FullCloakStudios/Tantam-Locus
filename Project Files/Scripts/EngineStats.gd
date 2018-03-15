extends Sprite

export(float) var thrust

func _ready():
	$"../".speed = thrust 

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			$"Particles2D".emitting = true
		else:
			$"Particles2D".emitting = false