extends Control


func _ready() -> void:
	$Main/Myself.connect("pressed", hover)
	$Main/PreBuild.connect("pressed", prebuild)
	$TextureRect/Button.connect("pressed", back)
	$AnimationPlayer.play("Click")

func hover():
	$AudioStreamPlayer.play()
	OS.delay_msec(50)
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/PrebuildConfig.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
	
func prebuild():
	$AudioStreamPlayer.play()
	OS.delay_msec(50)
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/PrebuildSelection.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")

func back():
	$AudioStreamPlayer.play()
	OS.delay_msec(50)
	get_tree().change_scene_to_file("res://Scenes/Welcome.tscn")
