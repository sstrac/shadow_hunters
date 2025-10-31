extends RichTextLabel


func _process(delta: float) -> void:
	text = "[center]Enemies Killed[center]%d" % EnemyTracker.killed_enemies
