extends TextureButton

export(String) var load_scene
var currentScene

func _on_TextureButton_button_up():
	currentScene.queue_free()
	var s = ResourceLoader.load(load_scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)