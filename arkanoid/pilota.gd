extends CharacterBody2D

var SPEED = Vector2(40, -40)

func _physics_process(delta):
	var collision = move_and_collide(SPEED * delta)
	
	if collision:
		var normal = collision.get_normal()
		var collider = collision.get_collider()
		
		SPEED = SPEED.bounce(normal)  
		print("Colisión con:", collider.name)
		
		if collider.name == "Jugador":
			var player = collider
			var distance = player.position.x - position.x
			var width = player.get_node("Sprite2D").texture.get_width() / 2
			var relation = distance / width
			var angle = relation * 45
			var angle_rad = -deg_to_rad(angle)
			
			SPEED = SPEED.rotated(angle_rad) * 1.2
			SPEED = SPEED.limit_length(300)  
			
			print(distance, width, relation, angle, angle_rad, SPEED)
		
		elif collider.is_in_group("Blocs"):
			SPEED = SPEED.bounce(normal)  
			collider.queue_free() 

	move_and_slide()  
