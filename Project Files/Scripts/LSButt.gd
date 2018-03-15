extends TextureButton


func _on_TextureButton_button_up():
	$"/root/World".playership.shouldMove = false
	$"/root/World/UI/Menu".popup(Rect2(160,30,700,500))

func _gui_input(event):
	if event is InputEventScreenTouch:
		get_tree().set_input_as_handled();