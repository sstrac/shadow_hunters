extends Node2D

@export var spawning: bool = true
@export var player_body : Node
@export var speed : int

const ENEMY_SCENE = preload("res://Scenes/enemy/Enemy.tscn")
const WOLF_SCENE = preload("res://Scenes/enemy/Wolf.tscn")

var enemy_types = [ENEMY_SCENE, ENEMY_SCENE, WOLF_SCENE]

func _ready():
	$SpawnTimer.start()
	$SpawnTimer.timeout.connect(_on_spawn_timer_timeout)
	
func _on_spawn_timer_timeout():
	if not EnemyTracker.max_reached:
		if spawning:
			spawn_enemy()

func spawn_enemy():
	var enemy = enemy_types.pick_random().instantiate()
	enemy.speed = speed
	enemy.player_body = player_body
	enemy.position = Vector2(0, 0)
	add_child(enemy)
	EnemyTracker.add_enemy()
