extends Control

func _ready() -> void:
	$Button.pressed.connect(hover)
	$AnimationPlayer.play("Explode")
	$AudioStreamPlayer.play()

func hover():
	get_tree().change_scene_to_file("res://Scenes/SavingScreen.tscn")
