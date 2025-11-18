extends CharacterBody2D

@onready var animated_sprite_1: AnimatedSprite2D = $AnimatedSprite2D  #dice with colors
@onready var supernova = $AnimatedSprite2D   #supernova
var speed = 3 #speed of expanding supernova

#SUPERNOVA EXPANDING
func _physics_process(delta: float) -> void:
	position += transform.y * speed * delta

	
#SUPERNOVA CHANGING COLOR
	
func _ready() -> void:
	supernova.pause()  # stop animation
	supernova.set_frame_and_progress(0, 0.0)



func _process(_delta):
	if animated_sprite_1.frame == 0:
		change_color_3()
	elif animated_sprite_1.frame == 1:
		change_color_6()
	
func change_color_3():
	supernova.set_frame_and_progress(1, 0.0)
	
func change_color_6():
	supernova.set_frame_and_progress(2, 0.0)

	
