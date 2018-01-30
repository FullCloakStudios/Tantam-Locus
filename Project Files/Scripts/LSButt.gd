extends TextureButton


func _on_TextureButton_button_up():
	$"/root/World".playership.shouldMove = false
	$"/root/World/UI/Menu".popup(Rect2(160,30,700,500))