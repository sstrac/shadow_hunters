extends Area2D


var damage = 35
var impact_multiplier = 500
var enemies_attacked := {}
var minimum_knockback = 500


func _on_area_entered(area: Area2D) -> void:
	var parent = area.get_parent()

	if enemies_attacked.has(parent):
		return

	enemies_attacked[parent] = true
	
	if ((parent.has_node("HealthComponent")) && (parent.name != "PlayerCharacter")):
		var  target_health = parent.get_node("HealthComponent")
		target_health.decrease_health(damage)
		knockback_enemy(target_health.get_parent())
	
	
func _ready():
	$AttackDurationTimer.start()
	$AttackDurationTimer.timeout.connect(_on_attack_timer_timeout)

func _on_attack_timer_timeout():
	queue_free()
	
	
func knockback_enemy(enemy):
	var direction: Vector2 = (enemy.global_position - get_parent().global_position).normalized()
	var impact = direction * impact_multiplier
	
	if impact.x + impact.y < minimum_knockback: 
		impact = impact * 2
	enemy.velocity =  ensure_min_abs_sum(impact, minimum_knockback)

	enemy.move_and_slide()

func ensure_min_abs_sum(v: Vector2, min_sum: float) -> Vector2:
	var current_sum = abs(v.x) + abs(v.y)
	if current_sum >= min_sum:
		return v
	var k = min_sum / current_sum
	return v * k
