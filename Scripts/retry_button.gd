extends Button


func _on_pressed() -> void:
	get_tree().set_pause(false)
	get_tree().change_scene_to_file("res://Scenes/level/Level.tscn")
	DayProgression.start()
	EnemyTracker.reset()
