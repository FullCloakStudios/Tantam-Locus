extends Sprite

export(String) var bullet
export(float) var firingarc
export(int) var firerate
var cfirerate 


func _ready():
	pass

func _draw():
	drawfiringarc(position, 80, -firingarc / 2, firingarc / 2, Color(0, 0, 1, 0.5))

func fire():
	if($"/root/World".has_node("Marker")):
		print("boom") #Do some targeting stuff


func drawfiringarc(centre, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	
	for i in range(nb_points+1):
		var angle_point = angle_from + i* (angle_to-angle_from) / nb_points - 90
		var point = centre + Vector2(cos(deg2rad(angle_point)), sin(deg2rad(angle_point)) ) * radius
		points_arc.push_back(point)
	for indexpoint in range(nb_points):
		draw_line(points_arc[indexpoint],points_arc[indexpoint+1],color)