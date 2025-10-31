extends RichTextLabel


func _process(delta: float) -> void:
	if ShadedTracker.time_shaded > Score.highest_shaded_time:
		Score.highest_shaded_time = ShadedTracker.time_shaded
	text = "[center]%d" % Score.highest_shaded_time
