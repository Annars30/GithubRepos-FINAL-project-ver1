extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
signal dice_2_rolled(result : int)
	
func process_dice_result():
	var result := randi_range(0,2)
	animated_sprite.set_frame_and_progress(result, 0)
	dice_2_rolled.emit(result)
		
	
	
func wait_and_stop():
	var wait_time = randf_range(1.1, 2)
	print(wait_time)
	await get_tree().create_timer(wait_time).timeout
	animated_sprite.stop()
	process_dice_result()


func _on_dice_1_rolled(result: int) -> void:
	animated_sprite.play("Dice_2")
	wait_and_stop()
