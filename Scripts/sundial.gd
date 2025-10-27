extends Node2D

@onready var dial: Control = get_node("Dial")

func _process(_delta: float) -> void:
	if DayProgression:
		if DayProgression.progress != 0:
			dial.rotation_degrees = -90 + DayProgression.progress * 180
