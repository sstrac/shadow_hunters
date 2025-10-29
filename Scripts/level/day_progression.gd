extends Node

const MAX_DAY_PROGRESS_SECONDS = 60
const NIGHT_PROGRESS_RATIO = 0.7

@onready var round_timer: Timer = get_node("RoundTimer")
@onready var night_timer: Timer = get_node("NightTimer")

var progress
var night

signal is_night
signal end

func _ready() -> void:
	start()
	round_timer.timeout.connect(_end)
	night_timer.timeout.connect(func(): is_night.emit(); night = true)

func _end():
	end.emit()
	
func start():
	progress = 0
	night = false
	round_timer.wait_time = MAX_DAY_PROGRESS_SECONDS
	round_timer.start()
	night_timer.wait_time = MAX_DAY_PROGRESS_SECONDS * NIGHT_PROGRESS_RATIO
	night_timer.start()

func _process(_delta: float) -> void:
	progress = 1 - (round_timer.time_left / MAX_DAY_PROGRESS_SECONDS)
