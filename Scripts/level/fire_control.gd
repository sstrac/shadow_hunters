extends Node

@export var fire_animation: AnimatedSprite2D
@onready var audio: AudioStreamPlayer2D = get_node("AudioStreamPlayer2D")
@onready var timer: Timer = get_node("Timer")

func _ready():
	timer.timeout.connect(get_parent().queue_free)

func start_fire():
	fire_animation.show()
	audio.play()
	timer.start()
