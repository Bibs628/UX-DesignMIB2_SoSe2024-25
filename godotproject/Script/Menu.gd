extends MainMenu

var start_game: MenuButton
var load_game: MenuButton
var settings: MenuButton
var exit: MenuButton


func _ready():
	"""
	"""
	start_game = get_node("StartGame")

	load_game = get_node("LoadGame")
	# TODO: Add save/load function
	load_game.disabled = true

	settings = get_node("Settings")
	settings.pressed.connect(switch_menu.bind(1))
	#settings.pressed.connect(() => switch_menu.bind(1))
	
	exit = get_node("Exit")
	exit.pressed.connect(quit_game)
