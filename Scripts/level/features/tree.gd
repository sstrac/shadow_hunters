extends "res://Scripts/level/features/feature.gd"

const TREE_1 = preload("res://Assets/img/tree.png")
const TREE_2 = preload("res://Assets/img/tree2.png")

@onready var sprite = get_node("Sprite2D")
@onready var s_sprite = get_node("ShadowSprite")

func _ready() -> void:
	sprite.texture = [TREE_1, TREE_2].pick_random()
	s_sprite.texture = [TREE_1, TREE_2].pick_random()
