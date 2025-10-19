extends Node2D


func _ready() -> void:
	get_node("Hand").get_child(randi_range(0,1)).show()
