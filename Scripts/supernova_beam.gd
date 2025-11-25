extends Area2D

@export var sprite_list: Array[Texture2D]
@onready var supernova_beam: Sprite2D = $Sprite2D
@export var speed: float = 400 
var direction: Vector2
@export var color_id: int 

func _physics_process(delta):
	position += direction * speed * delta

func _ready() -> void:
	supernova_beam.texture = sprite_list[color_id]
	

#BEAMS MUST APPEAR ON 2 CONDITIONS - DICE1 (0,1) + DICE 2 (0)
	#on_dice1_rolled - if result == 0 + on_dice2_rolled - if result == 0 --> beams3 appear (sprite list 1,2,4)
	#on_dice1_rolled - if result == 1 + on_dice2_rolled - if result == 0 --> beams6 appear (sprite list 0-5)
	
#func beams3_shoot():
	#_on_dice_1_rolled (result: 0)
	#_on_dice_2_rolled (result: 0)
		#beams3_appear()
	
	#func beams6_shoot():
	#_on_dice_1_rolled (result: 1)
	#_on_dice_2_rolled (result: 0)
		#beams6_appear()
