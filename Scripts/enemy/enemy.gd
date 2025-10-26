extends Node2D
@export var player_body : Node
@export var max_speed : int

@onready var movement_control_area = get_node("MovementControlArea")

var speed: int

func _ready():
	speed = max_speed
	movement_control_area.stop.connect(func(): speed = 0)
	movement_control_area.move.connect(func(): speed = max_speed)


func _process(_delta):
	z_index = int(global_position.y)
	
	
func _physics_process(delta: float):
	move_towards_player_node(delta)


func move_towards_player_node(delta: float):
	var direction = (player_body.global_position - global_position).normalized()
	global_position += direction * speed * delta
