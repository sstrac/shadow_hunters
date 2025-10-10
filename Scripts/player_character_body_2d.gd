extends CharacterBody2D

@export var speed: int = 100
@onready var anim_tree: AnimationTree = get_node("AnimationTree")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed


func _physics_process(_delta):
	get_input()
	handle_animation()
	move_and_slide()


func handle_animation():
	if velocity == Vector2.ZERO:
		anim_tree.get('parameters/playback').travel('Idle')
		
	else:
		anim_tree.get('parameters/playback').travel('Walk')
		anim_tree.set('parameters/Idle/blend_position', sign(velocity))
		anim_tree.set('parameters/Walk/blend_position', sign(velocity))
	
