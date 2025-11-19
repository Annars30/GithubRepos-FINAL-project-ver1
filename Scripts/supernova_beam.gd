extends Area2D

@export var sprite_list: Array[Texture2D]
@onready var supernova_beam: Sprite2D = $Sprite2D

func _ready() -> void:
	supernova_beam.texture = sprite_list[0]
