extends Area2D
var damage = 10

func _on_body_entered(body: Node2D) -> void:
	var parent = body.get_parent()
	print("trying to damage someone")
	if (parent.has_node("HealthComponent")):
		var  target_health = parent.get_node("HealthComponent")
		target_health.decrease_health(damage)
		print("Target has been damaged")
