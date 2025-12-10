extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
signal dice_1_rolled(result : int)
var spinning := false

func process_dice_result():
	var result := randi_range(0,1)
	animated_sprite.set_frame_and_progress(result, 0)
	dice_1_rolled.emit(result)


func _ready() -> void:
	animated_sprite.play("Dice_1")
	wait_and_stop()
	
func wait_and_stop():
	spinning = true
	var wait_time = randf_range(1.1, 2)
	print(wait_time)
	await get_tree().create_timer(wait_time).timeout
	animated_sprite.stop()
	process_dice_result()
	spinning = false
