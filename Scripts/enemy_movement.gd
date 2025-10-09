extends Node2D
@export var player_body : Node
@export var speed : int

func _physics_process(delta: float):
	move_towards_player_node(delta)


func move_towards_player_node(delta: float):
	var direction = (player_body.position - position).normalized()
	position += direction * speed * delta
