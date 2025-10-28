extends Area2D


var damage = 100000

func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	print("trying to damage someone")
	
	if ((parent.has_node("HealthComponent")) && (parent.name != "PlayerCharacter")):
		var  target_health = parent.get_node("HealthComponent")
		target_health.decrease_health(damage)
		print("Target has been damaged")
