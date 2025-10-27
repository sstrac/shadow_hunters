extends Area2D


func _ready():
	DayProgression.end.connect(queue_free)
	

func _on_body_entered(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:
		timer.add_shadow()


func _on_body_exited(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:
		timer.remove_shadow()
