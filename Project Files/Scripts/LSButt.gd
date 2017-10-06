extends TextureButton


func _on_TextureButton_button_up():
	$"/root/World/UI/PopupPanel".popup(Rect2(160,30,700,500))