extends Area2D 


var speed = 500

func _physics_process(delta: float) -> void:
	position -= transform.y * speed * delta
	
	#Erase anything the beam hits and the beam itself
#func _on_Yellow_beam_body_entered(body: Node2D) -> void:
	#if body.is_in_group("supernova"):
		#body.queue_free()
	#queue_free()
