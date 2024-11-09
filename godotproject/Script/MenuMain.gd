class_name MenuMain
extends BoxContainer

var start_game: MenuButton
var load_game: MenuButton
var settings: MenuButton
var exit: MenuButton


func _ready() -> void:
	"""
	Loads the main menu functionality. 
	Checks if a save exists through SaveState.
	"""
	start_game = $Start
	load_game = $Load
	settings = $Settings
	exit = $Exit

	load_game.disabled = not SaveState.save_exists()

	start_game.pressed.connect(SaveState.save_game)
	load_game.pressed.connect(implement_function)
	settings.pressed.connect(switch_to_settings)
	exit.pressed.connect(exit_game)


func implement_function() -> void:
	print("TODO: Implement script")


func switch_to_settings():
	visible = not visible


func exit_game():
	get_tree().quit()


func on_switch_to_menu():
	visible = not visible
