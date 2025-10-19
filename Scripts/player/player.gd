extends CharacterBody2D

@export var speed: int = 100
@onready var anim_tree: AnimationTree = get_node("AnimationTree")

var walking: bool = false
var last_direction: Vector2

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

	if velocity != Vector2.ZERO:
		last_direction = velocity.normalized()

func _process(_delta):
	z_index = int(global_position.y)

func _physics_process(_delta):
	get_input()
	handle_animation()
	move_and_slide()


func handle_animation():
	if velocity == Vector2.ZERO:
		walking = false
	else:
		walking = true

	anim_tree.set("parameters/conditions/idle", !walking)
	anim_tree.set("parameters/conditions/walking", walking)
	
	if last_direction:
		anim_tree.set("parameters/Walk/blend_position", last_direction)
		anim_tree.set("parameters/Idle/blend_position", last_direction)
	
