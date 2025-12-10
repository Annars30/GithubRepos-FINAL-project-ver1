extends Area2D
class_name ShipBeam
@export var sprite_list: Array[Texture2D]
@onready var ship_beam: Sprite2D = $Sprite2D
@export var speed: float = 350 
var direction: Vector2
@export var color_id: int = 0

func _ready() -> void:
	ship_beam.texture = sprite_list[color_id]

func _physics_process(delta):
	position += direction * speed * delta


#DESTORY SUPERNOVA COLORED ZONES - COLORED ZONES NOT DONE YET
#func _on_body_entered(body: Node2D) -> void:
	#if body is SupernovaStar and SupernovaWave:
		#var Star = body as SupernovaStar
		  #var orange_zone = randi_range (int(marker_2d_3.position.x), int(marker_2d_4.position.x))
		  #var orange_zone = color_id (2)
		  #if color_id == 0:
		#body.queue_free()
		#queue_free()
		#print ("Collision")
		  #orange_zone.queue_free()
		
#DESTORY SUPERNOVAWAVE COLORED ZONES - COLORED ZONES NOT DONE YET
#func _on_body_entered(body: Node2D) -> void:
	#if body is SupernovaWave:
		#var Wave = body as SupernovaWave
		  #var orange_zone = randi_range (int(marker_2d_3.position.x), int(marker_2d_4.position.x))
		  #var orange_zone = color_id (2)
		  #if color_id == 0:
		#body.queue_free()
		#queue_free()
		#print ("Collision")
		  #orange_zone.queue_free()
		
		
		
