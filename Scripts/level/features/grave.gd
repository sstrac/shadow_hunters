extends Node2D

const TILEMAP = preload("res://Assets/shadow_hunters_tilemap_16.png")

@onready var sprite = get_node("Sprite2D")
@onready var s_sprite = get_node("ShadowSprite")

func _ready() -> void:
	var rand_grave_x = 16 * (randi() % 4 + 1)
	sprite.region_rect = Rect2(rand_grave_x, 0, 16, 16)
	s_sprite.region_rect = Rect2(rand_grave_x, 0, 16, 16)
	
	
func _physics_process(_delta):
	z_index = int(global_position.y)
