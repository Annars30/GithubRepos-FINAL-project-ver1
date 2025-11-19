extends CharacterBody2D

@onready var supernova = $AnimatedSprite2D   #supernova
#var speed = 3 #speed of expanding supernova
var expand := false
var expand_speed := 2.0

#DICE1 ACTION EFFECT (3color,6color)
#SUPERNOVA CHANGING COLOR
func _ready() -> void:
	supernova.pause()  # stop animation
	supernova.set_frame_and_progress(0, 0.0)
	
func change_color_3():
	supernova.set_frame_and_progress(1, 0.0)
	
func change_color_6():
	supernova.set_frame_and_progress(2, 0.0)

func _on_dice_1_rolled(result: int) -> void:
	if result == 0:
		change_color_3()
	elif result == 1:
		change_color_6()



#DICE2 ACTION EFFECT (0beam,1wave,2expand)
func _physics_process(delta):
	if expand:
		supernova.position.y += expand_speed * delta

func _on_dice_2_rolled(result: int) -> void:
	if result == 2:
		expand = true

#func supernova_expand():
	#supernova.position.y -= position.y * speed - THIS MAKES SUPERNOVA MOVE ABRUPTLY 
	#move_and_slide()
	
	
