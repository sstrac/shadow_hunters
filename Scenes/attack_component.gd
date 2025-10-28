extends Area2D


var damage = 100000

func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()
	
	if ((parent.has_node("HealthComponent")) && (parent.name != "PlayerCharacter")):
		var  target_health = parent.get_node("HealthComponent")
		target_health.decrease_health(damage)

func _ready():
	$AttackTimer.start()
	$AttackTimer.timeout.connect(_on_attack_timer_timeout)
	


func _on_attack_timer_timeout():
	queue_free()
