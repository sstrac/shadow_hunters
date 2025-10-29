extends CharacterBody2D

@export var speed: int = 100
@export var attack_delay = 0.3
@onready var movement_anim_tree: AnimationTree = get_node("MovementAnimationTree")
@onready var health_comp = get_node("HealthComponent")

const ATTACK_COMPONENT = preload("res://Scenes/AttackComponent.tscn")

var walking: bool = false
var last_direction: Vector2
var attack_triggered: bool = false
var currently_attacking: bool = false

signal game_over

func _ready():
	health_comp.has_died.connect(_on_player_died)

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

	if velocity != Vector2.ZERO:
		last_direction = velocity.normalized()

	attack_triggered = Input.is_action_just_pressed("attack")

func _physics_process(_delta):
	z_index = int(global_position.y)
	get_input()
	movement_animation()
	move_and_slide()
	attack()

func movement_animation():
	if not currently_attacking:
		if velocity == Vector2.ZERO:
			walking = false
		else:
			walking = true
		
		if last_direction:
			movement_anim_tree.set("parameters/Walk/blend_position", last_direction)
			movement_anim_tree.set("parameters/Idle/blend_position", last_direction)

	movement_anim_tree.set("parameters/conditions/idle", !walking)
	movement_anim_tree.set("parameters/conditions/walking", walking)

func _on_player_died():
	game_over.emit()
	speed = 0

func attack():
	if (attack_triggered and not currently_attacking):
		var new_attack = ATTACK_COMPONENT.instantiate()
		add_child(new_attack)
		
		var direction = snapped(global_position.direction_to(get_global_mouse_position()), Vector2.ONE)
		new_attack.position = direction * 20
		
		movement_anim_tree.set("parameters/Walk/blend_position", direction)
		movement_anim_tree.set("parameters/Idle/blend_position", direction)

		currently_attacking = true
		get_tree().create_timer(attack_delay).timeout.connect(func(): currently_attacking = false)
		
