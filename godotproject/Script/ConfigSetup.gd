extends CenterContainer

@onready var back_to_menu := $Main/BackToMain
@onready var header := $Main/Header
@onready var newbie := $Main/Newbie


func _ready():
	back_to_menu.pressed.connect(back_to_main_menu)
	#header.text = "hi"
	newbie.pressed.connect(say_hi)


func back_to_main_menu():
	var loading_screen := LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/Menu.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")


func say_hi():
	print("hi")
