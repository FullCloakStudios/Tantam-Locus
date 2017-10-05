extends Sprite



func _draw():
	var c = Color(rand_range(-10,0.6), rand_range(0,10), rand_range(0,10))
	draw_circle(position, 180 , c) 