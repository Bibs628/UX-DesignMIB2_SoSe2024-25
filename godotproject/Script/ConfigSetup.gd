extends CenterContainer

@onready var beginner := $Main/Start
@onready var back_to_menu := $Main/BackToMain


func _ready():
	back_to_menu.pressed.connect(back_to_main_menu)


func back_to_main_menu():
	var loading_screen := LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/Menu.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
