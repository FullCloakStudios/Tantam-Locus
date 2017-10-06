extends TextureButton


func _on_TextureButton_button_up():
	$"/root/World/SaveManager".saveGame()