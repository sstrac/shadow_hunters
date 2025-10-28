extends CharacterBody2D

@export var speed: int = 100
@export var game_over_screen: Control
@onready var movement_anim_tree: AnimationTree = get_node("MovementAnimationTree")
@onready var health_comp = get_node("HealthComponent")


var walking: bool = false
var last_direction: Vector2

func _ready():
	pass
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

	if velocity != Vector2.ZERO:
		last_direction = velocity.normalized()

func _physics_process(_delta):
	z_index = int(global_position.y)
	health_comp.has_died.connect(on_player_died)		
	get_input()
	movement_animation()
	move_and_slide()

func movement_animation():
	if velocity == Vector2.ZERO:
		walking = false
	else:
		walking = true

	movement_anim_tree.set("parameters/conditions/idle", !walking)
	movement_anim_tree.set("parameters/conditions/walking", walking)
	
	if last_direction:
		movement_anim_tree.set("parameters/Walk/blend_position", last_direction)
		movement_anim_tree.set("parameters/Idle/blend_position", last_direction)

func on_player_died():
	speed = 0
	game_over_screen.show()
	stop_all_sounds(self)
	Engine.time_scale = 0

func stop_all_sounds(parent_node):
	for node in parent_node.get_tree().get_nodes_in_group("audio"):
		if node is AudioStreamPlayer or node is AudioStreamPlayer2D or node is AudioStreamPlayer3D:
			node.stop()
