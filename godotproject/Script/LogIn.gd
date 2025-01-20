extends Control


func _ready() -> void:
	$Submit.pressed.connect(switch_to_main)


func switch_to_main() -> void:
	get_tree().change_scene_to_file("res://Scenes/Welcome.tscn")
