@tool
extends PointLight2D

@onready var anim: AnimationPlayer = get_node("AnimationPlayer")
@onready var timer: Timer = get_node("Timer")

const MIN_FILL_TO = 1
const MAX_FILL_TO = 1.1

var rolling_delta = 0

func _ready():
	timer.wait_time = _random_wait_time()
	timer.timeout.connect(_flicker)
	timer.start()


func _process(delta):
	rolling_delta += delta
	var fill_to = sin(rolling_delta * 4) * 0.05
	texture.fill_to.x = fill_to
	
func _random_wait_time():
	return randi_range(1, 3)
	

func _random_num_flickers():
	return randi_range(1, 2)
	

func _flicker():
	timer.stop()
	var wait_time = _random_wait_time()
	var num_flickers = _random_num_flickers()
	var i = 0
	while i < num_flickers:
		anim.play('flicker')
		await anim.animation_finished
		i += 1
	
	timer.wait_time = wait_time
	timer.start()
	
