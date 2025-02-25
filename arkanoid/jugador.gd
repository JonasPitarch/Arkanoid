extends CharacterBody2D


const SPEED = 100.0


func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
		
	var direcction_speed = direction * SPEED
	move_and_collide(direcction_speed * delta)		
