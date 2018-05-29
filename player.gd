extends KinematicBody2D

const MOTION_SPEED = 500

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("move_down"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
