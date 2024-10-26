extends CharacterBody2D

class_name Player

@onready var animated_sprite = $AnimatedSprite2D

@export var speed = 50

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
	else:
		velocity = Vector2.ZERO
	
	update_animation()
	
	move_and_slide()

func update_animation():
	if velocity == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
