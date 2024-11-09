extends VBoxContainer


var start_game: MenuButton
var load_game: MenuButton
var settings: MenuButton
var exit: MenuButton


func _ready():
	start_game = get_node("Start")
	load_game = get_node("Load")
	
	# TODO: Add save/load game
	load_game.disabled = true
	settings = get_node("Settings")
	exit = get_node("Exit")

	start_game.pressed.connect(implement_function)
	load_game.pressed.connect(implement_function)
	settings.pressed.connect(switch_to_settings)
	exit.pressed.connect(exit_game)


func implement_function():
	print("TODO: Implement script")


func switch_to_settings():
	visible = not visible


func exit_game():
	get_tree().quit()


func on_switch_to_menu():
	visible = not visible
