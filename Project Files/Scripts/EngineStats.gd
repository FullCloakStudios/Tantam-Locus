extends Sprite

export(float) var thrust

func _ready():
	$"../".speed = thrust 

func _process(delta):
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		$"Particles2D".emitting = true
	else:
		$"Particles2D".emitting = false