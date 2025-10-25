extends "res://Scripts/enemy/enemy.gd"

@onready var sprite = get_node("WolfSprite")

func move_towards_player_node(delta: float):
	var direction = (player_body.global_position - global_position).normalized()
	global_position += direction * speed * delta
	if direction.x <= 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
	
