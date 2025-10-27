extends Sprite2D


var start_modulate

func _ready():
	start_modulate = modulate.a
	DayProgression.end.connect(queue_free)

	
func _process(_delta: float) -> void:
	modulate.a = start_modulate - DayProgression.progress
