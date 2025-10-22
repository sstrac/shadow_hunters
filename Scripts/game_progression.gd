extends Node

const MAX_DAY_PROGRESS = 60

var timer
var day_progress

func _ready() -> void:
	timer = get_tree().create_timer(MAX_DAY_PROGRESS)


func _process(delta: float) -> void:
	day_progress = 1 - (timer.time_left / MAX_DAY_PROGRESS)
