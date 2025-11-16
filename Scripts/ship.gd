extends CharacterBody2D


#MY VERSION
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#position.x += 10
	#if Input.is_action_pressed("move_left"):
		#position.x -= 10

		
		
	#PONG VERSION
const SPEED = 600.0
func _process(delta: float) -> void:
	var direction = 0.0
	if Input.is_action_pressed("move_right"):
		direction +=1
	if Input.is_action_pressed("move_left"):
		direction -=1
	
	velocity.y = 0
	velocity.x = direction * SPEED
	move_and_slide()
