extends Sprite

export(float) var turnspeed
export(PoolStringArray) var hardpointlist = PoolStringArray()
var hardpoints = []

func _ready():
	pass

func addtohardpoint(node):
	get_node(hardpointlist[hardpoints.size()]).add_child(node)
	return get_node(hardpointlist[hardpoints.size()]).get_path()
	hardpoints.append(node.get_name())

func removefromhardpoint(name):
	for n in hardpoints:
		for i in n.get_children():
			if(i.get_name() == name):i.queue_free()

