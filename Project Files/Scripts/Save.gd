extends Node

var load_scene = "res://Levels/Load.tscn"
var savefile

func saveGame():
	var savegame = File.new()
	#var err = savegame.open_encrypted_with_pass("user://savedata.bin", File.WRITE, "mypass")
	#Uncomment this ^ when we do the final release to encrypet save files
	savegame.open("user://" + savefile, File.WRITE)
	savegame.store_line(to_json($"/root/World".worldseed))
	var savenodes = get_tree().get_nodes_in_group("Save")
	for i in savenodes:
		var nodedata = i.save()
		savegame.store_line(to_json(nodedata))
	savegame.close()

func loadGame():
	var savegame = File.new()
	#var err = savegame.open_encrypted_with_pass("user://savedata.bin", File.WRITE, "mypass")
	#Uncomment this ^ when we do the final release
	if !savegame.file_exists("user://" + savefile):
		return
	
	var root = get_tree().get_root()
	var currentScene = root.get_child(root.get_child_count() -1)
	currentScene.queue_free()
	
	var s = ResourceLoader.load(load_scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)
	
	$"/root/World/SaveManager".savefile = savefile
	
	var currentline = {}
	savegame.open("user://" + savefile, File.READ)
	currentline = parse_json(savegame.get_line())
	$"/root/World".worldseed = currentline
	currentline = parse_json(savegame.get_line())
	while (!savegame.eof_reached()):
		var newobject = load(currentline["filename"]).instance()
		$"/root/World".add_child(newobject)
		newobject.position = (Vector2(currentline["posx"],currentline["posy"]))
		newobject.scale = (Vector2(currentline["scale"], currentline["scale"]))
		newobject.rotation = (currentline["rotate"])
		for i in currentline.keys():
			if (i == "filename" or i == "parent" or i == "posx" or i == "posy" or i == "scale" or i == "rotate"):
				continue
			newobject.set(i, currentline[i])
		currentline = parse_json(savegame.get_line())
	savegame.close()