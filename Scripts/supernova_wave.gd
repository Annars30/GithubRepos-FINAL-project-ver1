extends Area2D


@export var sprite_list: Array[Texture2D]
@onready var supernova_wave: Sprite2D = $Sprite2D

func _ready() -> void:
	supernova_wave.texture = sprite_list[0]
