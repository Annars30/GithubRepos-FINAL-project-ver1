extends CharacterBody2D
class_name SupernovaWave
@onready var supernova_wave: AnimatedSprite2D = $AnimatedSprite2D
@export var speed: float = 210
var direction: Vector2 = Vector2.ZERO
var move_speed := 10
var dice1_result: int 

#SETTING THE COLOR OF SUPERVAWES ACCORDING TO DICE1 RESULT
func wave_color(dice1_result: int):
	supernova_wave.frame = dice1_result

#SUPERWAVE MOVING
func _physics_process(delta):
	supernova_wave.position.y += move_speed * delta
