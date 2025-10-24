extends CharacterBody2D

@export var speed: int = 100

var AttackComponent = load("res://Scenes/AttackComponent.tscn")


@onready var movement_anim_tree: AnimationTree = get_node("MovementAnimationTree")
@onready var health_comp = get_node("HealthComponent")

var walking: bool = false
var last_direction: Vector2
var attacking: bool = false
var can_attack: bool = true
var attack_delay = 0.7

func _ready():
	
	#TEST called once to set label initially
	update_health_label()
	
	#TEST connects the health_changed signal to the update label function here
	health_comp.health_changed.connect(update_health_label)

#TEST
#updates the label to show health
func update_health_label(): get_node("TestHealthLabel").text = '%d' % health_comp.current_health
	
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

	if velocity != Vector2.ZERO:
		last_direction = velocity.normalized()
	
	attacking = Input.is_action_just_pressed("left click")
	
func _process(_delta):
	z_index = int(global_position.y)

func _physics_process(_delta):
	get_input()
	movement_animation()
	move_and_slide()
	attack()
	

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
	
func attack():
	#print("attempting to attack")
	if (attacking && can_attack):
		print("attack in progress")
		var new_attack = AttackComponent.instantiate()
		add_child(new_attack)
		new_attack.position = get_viewport().get_mouse_position()

		#remove_child(new_attack)

		can_attack = false
		get_tree().create_timer(attack_delay).timeout.connect(func(): can_attack = true)
