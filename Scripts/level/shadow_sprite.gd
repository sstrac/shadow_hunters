extends Sprite2D


func _ready():
	DayProgression.is_night.connect(queue_free)

	
func _process(_delta: float) -> void:
	modulate.a = 1 - DayProgression.progress
