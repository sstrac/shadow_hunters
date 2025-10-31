extends RichTextLabel


func _process(delta: float) -> void:
	text = "[center]Time Shaded[center]%ds" % ShadedTracker.time_shaded
