extends Timer

@export var sprite: AnimatedSprite2D
@export var health_comp: Node
@export var smoke: Node
@export var smoke_audio: AudioStreamPlayer2D
@export var damage = 10

var shaded_modulate = Color(0.345, 0.576, 0.718, 0.784)
var num_shadows = 0

func _ready() -> void:
	timeout.connect(_do_damage)
	DayProgression.is_night.connect(_disable_burning_forever)

	
func _do_damage():
	health_comp.decrease_health(damage)

func _disable_burning_forever():
	timeout.disconnect(_do_damage)
	smoke.hide()
	smoke_audio.stop()
	num_shadows = 999
	sprite.modulate = shaded_modulate
	queue_free()


func add_shadow():
	num_shadows += 1
	stop()
	smoke.hide()
	smoke_audio.stop()
	sprite.modulate = shaded_modulate
	
func remove_shadow():
	num_shadows -= 1
	if num_shadows == 0:
		start()
		smoke.show()
		smoke_audio.play()
		sprite.modulate = Color.WHITE
