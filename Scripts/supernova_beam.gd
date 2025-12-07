extends Area2D
class_name SupernovaBeam
@export var sprite_list: Array[Texture2D]
@onready var supernova_beam: Sprite2D = $Sprite2D
@export var speed: float = 160 
var direction: Vector2
@export var color_id: int

func _ready():
	connect("area_entered", _on_area_entered)
	
func _physics_process(delta):
	position += direction * speed * delta
	
	
func set_color(color):
	color_id = color
	supernova_beam.texture = sprite_list[color_id]


func _on_area_entered(area: Area2D) -> void:
	print("ENTER: ", area)
	if area is SupernovaBeam:
		area.queue_free()
		queue_free()
