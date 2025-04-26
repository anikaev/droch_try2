extends CharacterBody2D

@export var speed := 100
@onready var anim := $AnimatedSprite2D

func _physics_process(delta):
	var dir = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	elif Input.is_action_pressed("ui_left"):
		dir.x -= 1
	elif Input.is_action_pressed("ui_down"):
		dir.y += 1
	elif Input.is_action_pressed("ui_up"):
		dir.y -= 1

	# Воспроизведение анимации по направлению
	if dir.x > 0:
		anim.play("walk_right")
	elif dir.x < 0:
		anim.play("walk_left")
	elif dir.y > 0:
		anim.play("walk_down")
	elif dir.y < 0:
		anim.play("walk_up")
	else:
		anim.stop()

	velocity = dir.normalized() * speed
	move_and_slide()
