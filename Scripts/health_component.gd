extends Node

var maximum_health : int = 100
var current_health : int = 100 
@export var example : Node
signal has_died

func _ready():
	pass
	
func decrease_health(damage):
	current_health -= damage
	if current_health <= 0:
		has_died.emit()
	
func increase_health(amount):
	if current_health + amount > maximum_health:
		current_health = maximum_health
	else	:
		current_health += amount
	
