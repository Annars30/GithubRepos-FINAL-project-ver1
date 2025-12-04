extends Area2D

@export var sprite_list: Array[Texture2D]
@onready var supernova_beam: Sprite2D = $Sprite2D
@export var speed: float = 200 
var direction: Vector2
@export var color_id: int


func _physics_process(delta):
	position += direction * speed * delta
	
	
func set_color(color):
	color_id = color
	supernova_beam.texture = sprite_list[color_id]
