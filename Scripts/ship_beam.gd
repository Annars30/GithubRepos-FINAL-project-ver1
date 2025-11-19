extends Area2D

@export var sprite_list: Array[Texture2D]
@onready var ship_beam: Sprite2D = $Sprite2D

#func _ready() -> void:
	#sprite_2d.texture = sprite_list[2]

func _ready() -> void:
	ship_beam.texture = sprite_list[5]
