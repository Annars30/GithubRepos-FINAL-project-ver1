extends CharacterBody2D

@onready var dice_1 = $AnimatedSprite2D
var speed = 3


func _physics_process(delta: float) -> void:
	if dice_1.wait_and_stop:
		#SpriteFrames
		position += transform.y * speed * delta
		
	
#func _process(delta: float) -> void:
	#if spinning:
		#return
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and is_mouse_over: 
		#animated_sprite.play("Rolling")
		#wait_and_stop()
