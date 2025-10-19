extends Area2D

@export var player_node: Node2D

var is_colliding = false

signal stop
signal move

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(_body):
	is_colliding = true
	stop.emit()
		
func _on_body_exited(_body):
	is_colliding = false
	move.emit()
