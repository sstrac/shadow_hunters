extends Node

const MAX_DAY_PROGRESS_SECONDS = 60

var timer
var progress

func _ready() -> void:
	timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS)


func _process(delta: float) -> void:
	progress = 1 - (timer.time_left / MAX_DAY_PROGRESS_SECONDS)
