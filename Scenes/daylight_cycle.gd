extends Node2D

const DAWN = Color(0.442, 0.324, 0.285, 1.0)
const MIDDAY = Color(0.906, 0.843, 0.753,  1.0)
const NIGHT = Color(0, 0, 0, 1.0)

@export var dir_light: DirectionalLight2D

var closest_time_of_day = DAWN

func _ready() -> void:
	dir_light.color = DAWN

func _process(delta: float) -> void:
	print(dir_light.color)
	if dir_light.color.is_equal_approx(DAWN):
		closest_time_of_day = DAWN
	elif dir_light.color.is_equal_approx(MIDDAY):
		closest_time_of_day = MIDDAY
	elif dir_light.color.is_equal_approx(NIGHT):
		closest_time_of_day = NIGHT
		
	if closest_time_of_day == MIDDAY:
		dir_light.color = lerp(dir_light.color, NIGHT, delta)
	elif closest_time_of_day == NIGHT:
		dir_light.color = lerp(dir_light.color, DAWN, delta)
	elif closest_time_of_day == DAWN:
		dir_light.color = lerp(dir_light.color, MIDDAY, delta)
