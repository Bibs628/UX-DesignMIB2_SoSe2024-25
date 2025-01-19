class_name MenuMain
extends Control

@onready var start_game := $Start


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Tap"):
		$AnimationPlayer.play("IntroTap")
		$AudioStreamPlayer.play()


func _ready() -> void:
	$Start.position.y = 1830
	$AnimationPlayer.connect("animation_finished", start_new_config)


func start_new_config(_str: String) -> void:
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/Welcome.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")
