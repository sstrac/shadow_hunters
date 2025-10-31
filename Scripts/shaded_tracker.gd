extends Node


var time_shaded = 0.0
var shaded = false


func _process(delta):
	if shaded:
		time_shaded += delta


func reset():
	time_shaded = 0.0
	shaded = false
