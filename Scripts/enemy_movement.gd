extends Node2D
@export var player_body : Node
@export var speed : int

func _physics_process(delta: float):
	get_direction_to_player(delta)


func get_direction_to_player(delta: float):
	var direction = (player_body.position - position).normalized()
	position += direction * speed * delta
	print(position)
