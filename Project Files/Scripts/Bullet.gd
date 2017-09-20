extends RigidBody2D


func _fixed_process(delta):
	add_force(Vector2(), get_global_mouse_position() - get_tree().get_current_scene().get_node("playerShip").position)