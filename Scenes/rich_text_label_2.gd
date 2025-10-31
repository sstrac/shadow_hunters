extends RichTextLabel


func _process(delta: float) -> void:
	text = "[center]%d" % Score.highest_enemies_killed

	if EnemyTracker.killed_enemies > Score.highest_enemies_killed:
		Score.highest_enemies_killed = EnemyTracker.killed_enemies
