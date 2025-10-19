extends Area2D

var health = 10

func _on_body_entered(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:
		timer.add_shadow()


func _on_body_exited(body: Node2D) -> void:
	var timer = body.get_node_or_null('SunlightDamageTimer')

	if timer != null:	
		timer.remove_shadow()
		
