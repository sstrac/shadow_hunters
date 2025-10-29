extends Node2D

const MORNING = Color(0.9, 0.9, 0.9,  1.0)
const NIGHT = Color(0, 0, 0, 1.0)

@onready var dir_light: DirectionalLight2D = get_node("DirectionalLight2D")
@onready var player: Node2D = get_node("PlayerCharacter")
@onready var features_tilemap: TileMapLayer = get_node("Features")
@onready var game_over_screen = get_node("CanvasLayer/GameOver")
@onready var winner_screen = get_node("CanvasLayer/Winner")

func _ready() -> void:
	dir_light.color = MORNING
	player.game_over.connect(_on_game_over)
	EnemyTracker.won.connect(_on_won)

func _process(_delta: float) -> void:
	if DayProgression:
		dir_light.color = lerp(MORNING, NIGHT, DayProgression.progress)

func _on_game_over():
	game_over_screen.show()
	stop_all_sounds()
	get_tree().set_pause(true)

func _on_won():
	winner_screen.show()
	stop_all_sounds()
	get_tree().set_pause(true)
	
func stop_all_sounds():
	for node in get_tree().get_nodes_in_group("audio"):
		if node is AudioStreamPlayer or node is AudioStreamPlayer2D or node is AudioStreamPlayer3D:
			node.stop()
