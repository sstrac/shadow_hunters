extends Node

const MAX_DAY_PROGRESS_SECONDS = 60
const NIGHT_PROGRESS_RATIO = 0.7

var round_timer
var night_timer
var progress = 0
var night = false

signal is_night
signal end

func _ready() -> void:
	start()
	round_timer.timeout.connect(_end)
	night_timer.timeout.connect(func(): is_night.emit(); night = true)

func _end():
	end.emit()
	
func start():
	round_timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS)
	night_timer = get_tree().create_timer(MAX_DAY_PROGRESS_SECONDS * NIGHT_PROGRESS_RATIO)


func _process(_delta: float) -> void:
	progress = 1 - (round_timer.time_left / MAX_DAY_PROGRESS_SECONDS)
