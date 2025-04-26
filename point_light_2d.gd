extends PointLight2D

@export var min_wait_time = 0.2
@export var max_wait_time = 1.0
@export var flicker_intensity = 0.4

var original_energy = 1.0

func _ready():
	original_energy = energy
	flicker()

func flicker() -> void:
	while true:
		# Нормальный свет
		energy = original_energy
		await get_tree().create_timer(randf_range(min_wait_time, max_wait_time)).timeout
		
		# Ослабление света
		energy = original_energy * flicker_intensity
		await get_tree().create_timer(randf_range(0.05, 0.15)).timeout
