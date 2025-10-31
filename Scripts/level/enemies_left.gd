extends RichTextLabel


func _process(delta: float) -> void:
	text = "[center]Enemies Left[center]%d" % EnemyTracker.enemy_count
