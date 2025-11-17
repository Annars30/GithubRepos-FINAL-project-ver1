extends CharacterBody2D

@onready var animated_sprite_1: AnimatedSprite2D = $AnimatedSprite2D
@onready var supernova_3_color = $AnimatedSprite2D
var speed = 3

#SUPERNOVA EXPANDING
#func _physics_process(delta: float) -> void:
		#position += transform.y * speed * delta

	
#SUPERNOVA CHANGING COLOR
func start():
	_ready()
	
func _ready() -> void:
	supernova_3_color.pause()  # stop animation
	supernova_3_color.set_frame_and_progress(0, 0.0)

func _process(delta):
	if animated_sprite_1.frame == 0:
		change_color_3()
	elif animated_sprite_1.frame == 1:
		change_color_6()
	
func change_color_3():
	supernova_3_color.set_frame_and_progress(1, 0.0)
	
func change_color_6():
	supernova_3_color.set_frame_and_progress(2, 0.0)

	
