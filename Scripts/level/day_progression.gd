extends Node

const MAX_DAY_PROGRESS_SECONDS = 60
const NIGHT_PROGRESS_RATIO = 0.7

var round_timer
var night_timer
var progress = 0

signal is_night
signal end

func _ready() -> void:
	round_timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS)
	round_timer.timeout.connect(_end)
	
	night_timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS * NIGHT_PROGRESS_RATIO)
	night_timer.timeout.connect(is_night.emit)

func _end():
	end.emit()
	queue_free()
	
func _process(_delta: float) -> void:
	progress = 1 - (round_timer.time_left / MAX_DAY_PROGRESS_SECONDS)
