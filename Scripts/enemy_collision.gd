extends Area2D

@export var enemy_2d_node: Node2D
@export var player_node: Node2D
@export var speed : int

var is_colliding = false

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))
	
func _on_body_entered(body):
	is_colliding = true
	enemy_2d_node.speed = 0	
		
func _on_body_exited(body):
	is_colliding = false
	enemy_2d_node.speed = speed	
