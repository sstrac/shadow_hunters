extends Node2D

const TILEMAP = preload("res://Assets/shadow_hunters_tilemap_16.png")

@onready var sprite = get_node("Sprite2D")


func _physics_process(_delta):
	z_index = int(global_position.y)
