extends Button

export(String) var load_scene
var currentScene

func _ready():
	var root = get_tree().get_root()
	currentScene = root.get_child(root.get_child_count() -1)

func _on_NewGame_button_up():
	currentScene.queue_free()
	var s = ResourceLoader.load(load_scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
