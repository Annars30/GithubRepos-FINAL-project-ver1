extends Area2D

@onready var supernova_wave6 = $Sprite2D
@export var speed: float = 200
var direction: Vector2 = Vector2.ZERO
var move_speed := 10
var dice1_result: int 

func _physics_process(delta):
	supernova_wave6.position.y += move_speed * delta
