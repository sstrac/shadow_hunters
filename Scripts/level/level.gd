extends Node2D

const MORNING = Color(0.9, 0.9, 0.9,  1.0)
const NIGHT = Color(0, 0, 0, 1.0)

@onready var dir_light: DirectionalLight2D = get_node("DirectionalLight2D")

func _ready() -> void:
	dir_light.color = MORNING

func _process(_delta: float) -> void:
	if DayProgression:
		dir_light.color = lerp(MORNING, NIGHT, DayProgression.progress)
