extends CharacterBody2D

const SPEED = 200


@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	direction = direction.normalized()

	velocity = direction * SPEED
	move_and_slide()

	# Смена анимации по направлению
	if direction.x > 0:
		animated_sprite.play("walk_right")
	elif direction.x < 0:
		animated_sprite.play("walk_left")
	elif direction.y > 0:
		animated_sprite.play("walk_down")
	elif direction.y < 0:
		animated_sprite.play("walk_up") # Можешь отдельно сделать "walk_up", если есть кадры
	else:
		animated_sprite.stop() # Стоит — стопаем анимацию
