class_name MenuMain
extends BoxContainer

@onready var start_game := $Start
#@onready var load_game := $Load
#@onready var settings := $Settings
#@onready var exit := $Exit


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Tap"):
		start_new_config()

func _ready() -> void:
	"""
	Loads the main menu functionality. 
	Checks if a save exists through SaveState.
	"""
	#load_game.disabled = not SaveState.save_exists()

	start_game.pressed.connect(start_new_config)
	#load_game.pressed.connect(implement_function)
	#settings.pressed.connect(switch_to_settings)
	#exit.pressed.connect(exit_game)


func start_new_config() -> void:
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/Welcome.tscn"
	#get_tree().change_scene_to_packed(loading_screen)
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")


func implement_function() -> void:
	print("TODO: Implement script")


func switch_to_settings():
	visible = not visible


func exit_game():
	get_tree().quit()


func on_switch_to_menu():
	visible = not visible
