extends CharacterBody2D
@onready var ship_sprite = $AnimatedSprite2D
@onready var supernova = $AnimatedSprite2D


#MY VERSION
#func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_right"):
		#position.x += 10
	#if Input.is_action_pressed("move_left"):
		#position.x -= 10

	#MOVING THE SHIP
const SPEED = 600.0
func _process(delta: float) -> void:
	var direction = 0.0
	if Input.is_action_pressed("move_right"):
		direction +=1
	if Input.is_action_pressed("move_left"):
		direction -=1
	velocity.y = 0
	velocity.x = direction * SPEED
	move_and_slide()
	
	
	#SHOOTING
@onready var muzzle = $Muzzle
var Beam = preload("res://Scenes/ship_beam.tscn")

func _input(event):
	if event.is_action_pressed("fire_blue"):
		shoot(0)
	if event.is_action_pressed("fire_green"):
		shoot(1)
	if event.is_action_pressed("fire_orange"):
		shoot(2)
	if event.is_action_pressed("fire_red"):
		shoot(3)
	if event.is_action_pressed("fire_violet"):
		shoot(4)
	if event.is_action_pressed("fire_yellow"):
		shoot(5)

func shoot(color_id):
	var bullet = Beam.instantiate()
	bullet.global_position = muzzle.global_position
	bullet.direction = Vector2.UP
	bullet.color_id = color_id 
	get_tree().current_scene.add_child(bullet)
	

# CURRENTLY NOT COLLIDING WITH SUPERNOVA / SUPERNOVA BEAMS (BUT DOESN'T EXPLODE WHEN COLLIDING WITH WALLS
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision == supernova:
			ship_sprite.play("ship")
	else:
			pass
