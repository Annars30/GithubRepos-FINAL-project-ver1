extends CharacterBody2D
class_name Supernova

@onready var supernova = $AnimatedSprite2D   #supernova
@onready var supernova_wave3 = $Sprite2D #supernova wave3
@onready var supernova_wave6 = $Sprite2D #supernova wave6
@onready var supernova_beams3 = $Sprite2D #supernova beams3
var expand := false
var expand_speed := 7.0
@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_2: Marker2D = $Marker2D2
var current_color_id : int
var beam_colors_0 := [1, 2, 4]
var beam_colors_1 := [0, 1, 2, 3, 4, 5]


#DICE1 ACTION EFFECT (3color,6color)
#SUPERNOVA CHANGING COLOR
func _ready() -> void:
	supernova.pause()  # stop animation
	supernova.set_frame_and_progress(0, 0.0)
	
func change_color(color_id : int):
	current_color_id = color_id
	if color_id == 0:
		supernova.set_frame_and_progress(1, 0.0)
	elif color_id == 1:
		supernova.set_frame_and_progress(2, 0.0)

func _on_dice_1_rolled(result: int) -> void:
	change_color(result)



#DICE2 ACTION EFFECT (0beam,1wave,2expand)
#EXPAND
func _physics_process(delta):
	if expand:
		supernova.position.y += expand_speed * delta

func _on_dice_2_rolled(result: int) -> void:
	if result == 2:
		expand = true
	elif result == 0:
		super_beam3_shoot(current_color_id)
	elif result == 1:
		wave3_move()
	
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
	if color_id == 0:
		for number in beam_colors_0:
			var supbeam3 = super_beam3.instantiate()
			supbeam3.direction = Vector2.DOWN
		
			var random_x := randi_range(marker_2d.position.x, marker_2d_2.position.x)
			add_child(supbeam3)
			supbeam3.set_color(number)
			supbeam3.position = Vector2(random_x, marker_2d.position.y)
			print(supbeam3.position)
	elif color_id == 1:
		for number in beam_colors_1:
			var supbeam3 = super_beam3.instantiate()
			supbeam3.direction = Vector2.DOWN
			
			var random_x := randi_range(marker_2d.position.x, marker_2d_2.position.x)
			add_child(supbeam3)
			supbeam3.set_color(number)
			supbeam3.position = Vector2(random_x, marker_2d.position.y)
			print(supbeam3.position)
	
