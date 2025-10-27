extends Node2D

var flammable


func _ready() -> void:
	var weapon = randi_range(0,1)
	get_node("Hand").get_child(weapon).show()
	if weapon == 1:
		flammable = true
