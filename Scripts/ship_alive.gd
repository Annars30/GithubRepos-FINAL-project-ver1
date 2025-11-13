extends CharacterBody2D

#THIS WAS BEFORE
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#position.x += 7
	#if Input.is_action_pressed("move_left"):
		#position.x -= 7
		
	
const SPEED = 400.0
var collision = move_and_collide

		
		
func _process(delta: float) -> void:
	var direction = 0.0
	if Input.is_action_pressed("move_right"):
		direction +=1
	if Input.is_action_pressed("move_left"):
		direction -=1
	velocity.x = direction * SPEED

	move_and_slide()

	 
	
