@tool
extends PointLight2D

@onready var anim: AnimationPlayer = get_node("AnimationPlayer")
@onready var flicker_timer: Timer = get_node("FlickerTimer")
@onready var on_timer: Timer = get_node("OnTimer")

const MIN_FILL_TO = 1
const MAX_FILL_TO = 1.1

var rolling_delta = 0
var day_progress_until_switch_on = 0.7

func _ready():
	on_timer.wait_time = DayProgression.MAX_DAY_PROGRESS_SECONDS * day_progress_until_switch_on
	on_timer.timeout.connect(_switch_on)
	on_timer.start()
	
	color = Color.WHITE


func _process(delta):
	#Undulating light
	rolling_delta += delta
	var fill_to = sin(rolling_delta * 4) * 0.05
	texture.fill_to.x = fill_to
	
	#Brightness based on time of day
	if not Engine.is_editor_hint(): #Runs only outside editor (throws singleton retrieval errors otherwise)
		if DayProgression:
			color.a = DayProgression.progress
	
	
func _random_wait_time():
	return randi_range(1, 3)
	

func _random_num_flickers():
	return randi_range(1, 2)
	

func _switch_on():
	show()
	call_deferred("_flicker", 2)
	flicker_timer.wait_time = _random_wait_time()
	flicker_timer.timeout.connect(_flicker.bind(_random_num_flickers()))
	flicker_timer.start()


func _flicker(num_flickers):
	flicker_timer.stop()
	var wait_time = _random_wait_time()
	var i = 0
	while i < num_flickers:
		anim.play('flicker')
		await anim.animation_finished
		i += 1
	
	flicker_timer.wait_time = wait_time
	flicker_timer.start()
	
