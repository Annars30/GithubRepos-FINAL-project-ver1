extends CharacterBody2D

@onready var supernova = $AnimatedSprite2D   #supernova
@onready var supernova_wave3 = $Sprite2D #supernova wave 3
@onready var supernova_wave6 = $Sprite2D #supernova wave 6

var expand := false
var expand_speed := 2.0
var wave3_scene = preload("res://Scenes/supernova_wave_3.tscn")
var wave6_scene = preload ("res://Scenes/supernova_wave_6.tscn")

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
#EXPAND
func _physics_process(delta):
	if expand:
		supernova.position.y += expand_speed * delta

func _on_dice_2_rolled(result: int) -> void:
	if result == 2:
		expand = true
	
	
	#WAVE MUST APPEAR ON 2 CONDITIONS - DICE1 (0,1) + DICE 2 (1)
	#on_dice1_rolled - if result == 0 + on_dice2_rolled - if result == 1 --> wave3 appear
	#on_dice1_rolled - if result == 1 + on_dice2_rolled - if result == 1 --> wave6 appear
	
#func wave3_shoot():
	#_on_dice_1_rolled (result: 0)
	#_on_dice_2_rolled (result: 1)
		#wave3_appear()
	
	#func wave6_shoot():
	#_on_dice_1_rolled (result: 0)
	#_on_dice_2_rolled (result: 1)
		#wave6_appear()
		
func wave3_move():
	var wave = wave3_scene.instantiate()
	wave.global_position = Vector2(646, 97)
	wave.direction = Vector2.DOWN
	get_tree().current_scene.add_child(wave)

func wave6_move():
	var wave2 = wave6_scene.instantiate()
	wave2.global_position = Vector2(646, 97)
	wave2.direction = Vector2.DOWN
	get_tree().current_scene.add_child(wave2)
	
	
	
#func supernova_expand():
	#supernova.position.y -= position.y * speed - THIS MAKES SUPERNOVA MOVE ABRUPTLY 
	#move_and_slide()
	
	
