extends Area2D
class_name SupernovaBeam
@export var sprite_list: Array[Texture2D]
@onready var supernova_beam: Sprite2D = $Sprite2D
@export var speed: float = 100 
var direction: Vector2
#0 : Blue, 1: Green
@export var color_id: int
@onready var ship_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var life_score: AnimatedSprite2D = $AnimatedSprite2D
#@onready var reload_timer: Timer = $GameReload

#SUPERBEAM MOVING
func _physics_process(delta):
	position += direction * speed * delta
	
	
#SETTING THE COLORS OF SUPERBEAMS
func set_color(color):
	color_id = color
	supernova_beam.texture = sprite_list[color_id]
	
#IF SHIPBEAM COLORS MATCH SUPERNOVA BEAMS - THEY GET ERASED
#beam.color_id
#color_id
#func _on_area_entered(area: Area2D) -> void:
	#if area is ShipBeam:
		#var beam = area as ShipBeam
		#if beam.color_id == color_id:
			#area.queue_free()
			#queue_free()

#SUPERBEAMS COLLIDING WITH (contrast color_id)SHIPBEAMS AND ERASING EACH OTHER
func _on_area_entered(area: Area2D) -> void:
	if area is ShipBeam:
		var beam = area as ShipBeam
		if color_id == 0 and beam.color_id == 2:
			area.queue_free()
			queue_free()
		elif color_id == 1 and beam.color_id == 3:
			area.queue_free()
			queue_free()
		elif color_id == 2 and beam.color_id == 0:
			area.queue_free()
			queue_free()
		elif color_id == 3 and beam.color_id == 1:
			area.queue_free()
			queue_free()
		elif color_id == 4 and beam.color_id == 5:
			area.queue_free()
			queue_free()
		elif color_id == 5 and beam.color_id == 4:
			area.queue_free()
			queue_free()

#WHEN SUPERNOVA BEAM ENTERS SHIP, SHIP EXPLODES AND SUPERNOVA BEAM GETS ERASED
#RIGHT NOW SHIP DESTRUCTION IS BEING REPLAYED AFTER THE EXPLOSION (
func _on_body_entered(body: Node2D) -> void:
	if body is SHIP:
		body.ship_sprite.play("ship")
		#body.queue_free() AFTER ANIMATION IS PLAYED
		queue_free()
