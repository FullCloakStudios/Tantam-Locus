extends RigidBody2D

var damage = 10

func _ready():
	set_contact_monitor(true)
	set_max_contacts_reported(1)

func _physics_process(delta):
	if($"/root/World".has_node("Marker")):
		add_force(Vector2(), $"/root/World/Marker".global_position - $"/root/World/playerShip".position)
	var bodies = get_colliding_bodies()
	for i in bodies:
		if "health" in i:
			i.health -= damage
		free()