extends RigidBody2D

var damage = 10

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(3)

func _fixed_process(delta):
	add_force(Vector2(), get_global_mouse_position() - $"../../".position)
	var bodies=get_colliding_bodies()
	for i in bodies:
		if "health" in i:
			i.health -= damage
			free()
