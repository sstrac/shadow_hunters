extends Node2D

const MORNING = Color(0.9, 0.9, 0.9,  1.0)
const NIGHT = Color(0, 0, 0, 1.0)

@export var dir_light: DirectionalLight2D

func _ready() -> void:
	dir_light.color = MORNING

func _process(delta: float) -> void:
	get_node("Label").set_text('%f' % GameProgression.day_progress)

	dir_light.color = lerp(MORNING, NIGHT, GameProgression.day_progress )
