extends Timer

@export var health_comp: Node
@export var smoke: Node
@export var smoke_audio: AudioStreamPlayer2D
@export var damage = 10

var num_shadows = 0

func _ready() -> void:
	timeout.connect(_do_damage)
	
func _do_damage():
	health_comp.decrease_health(damage)

func add_shadow():
	num_shadows += 1
	stop()
	smoke.hide()
	smoke_audio.stop()
	
func remove_shadow():
	num_shadows -= 1
	if num_shadows == 0:
		start()
		smoke.show()
		smoke_audio.play()
