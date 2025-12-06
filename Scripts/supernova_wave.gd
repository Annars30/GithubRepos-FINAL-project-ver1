extends CharacterBody2D

@onready var supernova_wave: AnimatedSprite2D = $AnimatedSprite2D
@export var speed: float = 200
var direction: Vector2 = Vector2.ZERO
var move_speed := 10
var dice1_result: int 

func wave_color():
	if supernova_wave.sprite_frames.has_animation("wave"):
		supernova_wave.play("wave")
		supernova_wave.frame = dice1_result
		
func _physics_process(delta):
	supernova_wave.position.y += move_speed * delta
