extends Control


func _ready() -> void:
	$Main/NewPC.connect("pressed", hover)


func hover():
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/PrebuildSelection.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
