extends Area2D

@onready var shadow_light: PointLight2D = get_node("PointLight2D")

var health = 10

func _on_body_entered(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:
		timer.add_shadow()


func _on_body_exited(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:	
		timer.remove_shadow()
		


func _process(_delta: float) -> void:
	shadow_light.color.a = 1 - DayProgression.progress
