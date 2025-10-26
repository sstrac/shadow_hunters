extends Node

const MAX_ENEMIES = 30

var enemy_count = 0
var max_reached: bool = false

func add_enemy():
	enemy_count += 1
	_update_max_reached()

	
func remove_enemy():
	enemy_count -= 1
	_update_max_reached()


func _update_max_reached():
	if enemy_count >= MAX_ENEMIES:
		max_reached = true
	else:
		max_reached = false
