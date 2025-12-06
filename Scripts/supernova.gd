extends CharacterBody2D


@onready var supernova = $AnimatedSprite2D   #supernova
@onready var supernova_wave: AnimatedSprite2D = $AnimatedSprite2D#supernova wave
@onready var supernova_beams = $Sprite2D #supernova beams
var expand := false
var expand_speed := 7.0
@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_2: Marker2D = $Marker2D2
var current_color_id : int
var beam_colors_0 := [1, 2, 4]
var beam_colors_1 := [0, 1, 2, 3, 4, 5]
@onready var beam_timer: Timer = $BeamTimer
var dice1_result: int


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
		super_beam_shoot(current_color_id)
		beam_timer.start()
	elif result == 1:
		wave_move()
#WAVE
var wave_scene = preload("res://Scenes/supernova_wave.tscn")
func wave_move():
	var wave = wave_scene.instantiate()
	wave.global_position = Vector2(646, 97)
	wave.direction = Vector2.DOWN
	get_tree().current_scene.add_child(wave)
	wave.wave_color()

#BEAMS
var super_beam = preload ("res://Scenes/supernova_beam.tscn")
func super_beam_shoot(color_id):
	if color_id == 0:
		for number in beam_colors_0:
			var supbeam = super_beam.instantiate()
			supbeam.direction = Vector2.DOWN
		
			var random_x := randi_range(marker_2d.position.x, marker_2d_2.position.x)
			add_child(supbeam)
			supbeam.set_color(number)
			supbeam.position = Vector2(random_x, marker_2d.position.y)
			print(supbeam.position)
	elif color_id == 1:
		for number in beam_colors_1:
			var supbeam = super_beam.instantiate()
			supbeam.direction = Vector2.DOWN
			
			var random_x := randi_range(marker_2d.position.x, marker_2d_2.position.x)
			add_child(supbeam)
			supbeam.set_color(number)
			supbeam.position = Vector2(random_x, marker_2d.position.y)
			print(supbeam.position)


#BEAMS SHOOTING INFINITELY
func _on_beam_timer_timeout() -> void:
	super_beam_shoot(current_color_id)
