extends Node

const DAMAGE_ANIMATION = 'flash_red'
const HEALING_ANIMATION = 'flash_green'

@export var maximum_health : int = 100
@export var current_health : int = 100 
@export var anim: AnimationPlayer
@export var audio: AudioStreamPlayer2D

signal has_died
signal health_changed

func _ready():
	anim = $"../AnimationPlayer"
	audio = $"../DamageAudio"

	
func decrease_health(damage):
	if current_health > 0:
		current_health -= damage
		health_changed.emit()
		
		anim.play(DAMAGE_ANIMATION)
		audio.play()
		
		if current_health <= 0:
			has_died.emit()
		
		if current_health < 0:
			current_health = 0

	
func increase_health(amount):
	if current_health + amount > maximum_health:
		current_health = maximum_health
	else:
		current_health += amount
		
	health_changed.emit()
	anim.play(HEALING_ANIMATION)
