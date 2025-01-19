class_name MenuMain
extends BoxContainer

@onready var start_game := $Start


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Tap"):
		start_new_config()


func _ready() -> void:
	"""
	Loads the main menu functionality. 
	Checks if a save exists through SaveState.
	"""
	start_game.pressed.connect(start_new_config)


func start_new_config() -> void:
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/Welcome.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
