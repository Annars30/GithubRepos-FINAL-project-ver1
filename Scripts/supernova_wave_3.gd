extends CharacterBody2D

@onready var supernova_wave3 = $Sprite2D
@export var speed: float = 200
var direction: Vector2 = Vector2.ZERO
var move_speed := 10

func _physics_process(delta):
	supernova_wave3.position.y += move_speed * delta
