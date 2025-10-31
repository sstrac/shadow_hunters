extends Node

const MAX_ENEMIES = 30

var enemy_count = 0
var killed_enemies = 0
var max_reached: bool = false

signal won


func add_enemy():
	enemy_count += 1
	_update_max_reached()

	
func remove_enemy():
	enemy_count -= 1
	killed_enemies += 1
	_update_max_reached()
	if enemy_count == 0 and DayProgression.night == true:
		won.emit()

func _update_max_reached():
	if enemy_count >= MAX_ENEMIES:
		max_reached = true
	else:
		max_reached = false
		
func reset():
	enemy_count = 0
	killed_enemies = 0
	max_reached = false
