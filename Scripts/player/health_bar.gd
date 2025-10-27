extends ProgressBar


@export var health_comp: Node

func _ready() -> void:
	max_value = health_comp.maximum_health
	
	
func _process(_delta: float) -> void:
	value = health_comp.current_health
	
