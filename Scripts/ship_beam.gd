extends Area2D
@export var sprite_list: Array[Texture2D]
@onready var ship_beam: Sprite2D = $Sprite2D
@export var speed: float = 350 
var direction: Vector2
@export var color_id: int = 0

func _ready() -> void:
	ship_beam.texture = sprite_list[color_id]

func _physics_process(delta):
	position += direction * speed * delta
