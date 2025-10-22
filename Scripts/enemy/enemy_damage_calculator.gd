extends Area2D

@export var damage: int = 1
@export var damage_interval: float = 0.5
var player_in_area: Node = null

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))

func _on_body_entered(body):
	if body.is_class("CharacterBody2D"):
		player_in_area = body
		_start_damaging_player()
		
func _on_body_exited(body):
	if body == player_in_area:
		player_in_area = null

func _start_damaging_player():
	while player_in_area:
		if player_in_area:
			var healthComponent = player_in_area.get_node("HealthComponent")
			healthComponent.decrease_health(damage);
		await get_tree().create_timer(damage_interval).timeout
		
