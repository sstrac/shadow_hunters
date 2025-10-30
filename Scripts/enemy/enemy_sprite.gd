extends Node2D

var flammable

const FARMER1 = preload("res://Assets/spriteframes/farmer1_spriteframes.tres")
const FARMER2 = preload("res://Assets/spriteframes/farmer2_spriteframes.tres")
const FARMER3 = preload("res://Assets/spriteframes/farmer3_spriteframes.tres")

func _ready() -> void:
	var sprite = get_node("AnimatedSprite2D")
	sprite.sprite_frames = [FARMER1, FARMER2, FARMER3].pick_random()
	sprite.play()
	
	var weapon = randi_range(0,1)
	get_node("Hand").get_child(weapon).show()
	if weapon == 1:
		flammable = true
