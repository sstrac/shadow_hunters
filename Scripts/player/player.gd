extends CharacterBody2D

@export var speed: int = 100
@onready var movement_anim_tree: AnimationTree = get_node("MovementAnimationTree")
@onready var health_comp = get_node("HealthComponent")

var walking: bool = false
var last_direction: Vector2

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

func _process(_delta):
	z_index = int(global_position.y)

func _physics_process(_delta):
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
	
