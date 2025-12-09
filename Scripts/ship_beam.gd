extends Area2D
class_name ShipBeam
@export var sprite_list: Array[Texture2D]
@onready var ship_beam: Sprite2D = $Sprite2D
@export var speed: float = 350 
var direction: Vector2
@export var color_id: int = 0
@onready var SupernovaStar = $AnimatedSprite2D 
@onready var marker_2d: Marker2D = $Marker2D
@onready var marker_2d_2: Marker2D = $Marker2D2

#@export var wave = $AnimatedSprite2D

func _ready() -> void:
	ship_beam.texture = sprite_list[color_id]

func _physics_process(delta):
	position += direction * speed * delta


#func _on_body_entered(body: Node2D) -> void:
	#if body is SupernovaWave:
		#var wave := body as SupernovaWave
		#var wave_color := wave.get_zone_color()
		#if color_id == wave_color:
			#var random_x := randi_range(int(marker_2d.position.x), int(marker_2d_2.position.x))
			#wave.position.x = random_x
			#wave.queue_free()
			#queue_free()
