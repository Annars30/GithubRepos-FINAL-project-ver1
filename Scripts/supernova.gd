extends CharacterBody2D

@onready var supernova = $AnimatedSprite2D   #supernova
@onready var supernova_wave3 = $Sprite2D #supernova wave3
@onready var supernova_wave6 = $Sprite2D #supernova wave6
@onready var supernova_beams3 = $Sprite2D #supernova beams3
var expand := false
var expand_speed := 7.0


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
	elif result == 0:
	#+_dice_1_rolled (result: 0):
		super_beam3_shoot(1)
		super_beam3_shoot(2)
		super_beam3_shoot(4)
	
	#WAVE MUST APPEAR ON 2 CONDITIONS - DICE1 (0,1) + DICE 2 (1)
	#on_dice1_rolled - if result == 0 + on_dice2_rolled - if result == 1 --> wave3 appear
	#on_dice1_rolled - if result == 1 + on_dice2_rolled - if result == 1 --> wave6 appear
	
#func wave3_shoot():
	#_on_dice_1_rolled (result: 0)
	#_on_dice_2_rolled (result: 1)
		#wave3_appear()
	
	#func wave6_shoot():
	#_on_dice_1_rolled (result: 1)
	#_on_dice_2_rolled (result: 1)
		#wave6_appear()
var wave3_scene = preload("res://Scenes/supernova_wave_3.tscn")
func wave3_move():
	var wave = wave3_scene.instantiate()
	wave.global_position = Vector2(646, 97)
	wave.direction = Vector2.DOWN
	get_tree().current_scene.add_child(wave)

var wave6_scene = preload ("res://Scenes/supernova_wave_6.tscn")
func wave6_move():
	var wave2 = wave6_scene.instantiate()
	wave2.global_position = Vector2(646, 97)
	wave2.direction = Vector2.DOWN
	get_tree().current_scene.add_child(wave2)
	
	
var super_beam3 = preload ("res://Scenes/supernova_beam.tscn")
func super_beam3_shoot(color_id):
	var supbeam3 = super_beam3.instantiate()
	#supbeam3.global_position = Vector2(random_x, 1108)
	supbeam3.direction = Vector2.DOWN
	supbeam3.color_id = color_id 
	get_tree().current_scene.add_child(supbeam3)
	

	
#func supernova_expand():
	#supernova.position.y -= position.y * speed - THIS MAKES SUPERNOVA MOVE ABRUPTLY 
	#move_and_slide()
	
