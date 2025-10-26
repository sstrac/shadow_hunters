extends Node

const MAX_DAY_PROGRESS_SECONDS = 60

var timer
var progress = 0

signal is_night

func _ready() -> void:
	timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS)


func _process(_delta: float) -> void:
	if progress >= 1:
		is_night.emit()
		queue_free()
	else:
		progress = 1 - (timer.time_left / MAX_DAY_PROGRESS_SECONDS)
