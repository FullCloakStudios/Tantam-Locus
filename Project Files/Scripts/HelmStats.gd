extends Sprite

export(float) var turnspeed
export(PoolStringArray) var hardpointlist = PoolStringArray()
var hardpoints = []

func _ready():
	pass

func addtohardpoint(node):
	get_node(hardpointlist[hardpoints.size() - 1]).add_child(node)
	hardpoints.append(node.get_name())
	return get_node(hardpointlist[hardpoints.size() - 1]).get_path()

func removefromhardpoint(name):
	for n in hardpoints:
		for i in n.get_children():
			if(i.get_name() == name):i.queue_free()

