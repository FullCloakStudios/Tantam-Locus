extends Button

export(String) var load_scene
var current_scene

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)

func goto_scene(path):
	current_scene.queue_free()
	load(load_scene)


func _on_NewGame_button_up():
	pass

func _process(delta):
	