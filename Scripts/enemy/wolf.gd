extends CharacterBody2D

@onready var sprite = get_node("WolfSprite")

var player_body : Node
@export var max_speed : int

@onready var movement_control_area = get_node("MovementControlArea")
@onready var health_comp = get_node("HealthComponent")

var speed: int

func _ready():
	speed = max_speed
	movement_control_area.stop.connect(func(): speed = 0)
	movement_control_area.move.connect(func(): speed = max_speed)

func _process(_delta):
	z_index = int(global_position.y)
	
	
func _physics_process(delta: float):
	move_towards_player_node(delta)


func move_towards_player_node(_delta: float):
	var direction = (player_body.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()

	if direction.x <= 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false


func _on_health_component_has_died() -> void:
	EnemyTracker.remove_enemy()
	queue_free()
