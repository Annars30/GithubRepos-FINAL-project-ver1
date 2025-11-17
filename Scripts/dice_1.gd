extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_mouse_over = false
var spinning := false



func do_something():
	var result := randi_range(0,1)
	animated_sprite.set_frame_and_progress(result, 0)
	#do stuff with result


func _on_area_2d_mouse_entered() -> void:
	is_mouse_over = true

func _on_area_2d_mouse_exited() -> void:
	is_mouse_over = false

func _process(delta: float) -> void:
	if spinning:
		return
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and is_mouse_over: 
		animated_sprite.play("Dice_1")
		wait_and_stop()
	
func wait_and_stop():
	spinning = true
	var wait_time = randf_range(1.1, 2)
	print(wait_time)
	await get_tree().create_timer(wait_time).timeout
	animated_sprite.stop()
	do_something()
	spinning = false
