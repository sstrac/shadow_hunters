extends Node2D

@export var player_body : Node
@export var speed : int

const enemy_scene = preload("res://Scenes/enemy/Enemy.tscn")

func _ready():
	$SpawnTimer.start()
	$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)
	
func _on_spawn_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.speed = speed
	enemy.player_body = player_body
	enemy.position = Vector2(0, 0)
	print("Enemy has been spawned")
	add_child(enemy)
