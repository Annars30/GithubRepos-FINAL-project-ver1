extends CharacterBody2D

func _process(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		position.x += 12
	if Input.is_action_pressed("move_left"):
		position.x -= 12
