extends Area2D

var restart_area := Rect2(Vector2(350, 620), Vector2(74, 74))

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var mouse_pos = get_global_mouse_position()
		if restart_area.has_point(mouse_pos):
			get_tree().reload_current_scene()
		
