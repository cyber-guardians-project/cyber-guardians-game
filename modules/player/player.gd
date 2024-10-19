extends CharacterBody2D

class_name Player

@onready var animated_sprite = $AnimatedSprite2D

@export var speed = 050

func _physics_process(delta):
	move_player()

func move_player():
	var direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed

		update_animation(direction)
		move_and_slide()
		
func update_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
		
	if direction != Vector2.ZERO:
		animated_sprite.play("idle")
		
	
