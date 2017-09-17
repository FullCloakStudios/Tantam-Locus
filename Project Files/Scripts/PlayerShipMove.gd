extends KinematicBody2D

export var Motion_Speed = 100

var move

func _ready():
	set_fixed_process(true)
	move = Vector2(0,0)

func _fixed_process(delta):
	var motion = Vector2()
	motion = (move / Motion_Speed) * delta
	move(motion)
	

func _input(event):
	if(event == InputEventScreenDrag):
		move =+ event.relative_pos