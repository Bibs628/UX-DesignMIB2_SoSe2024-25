extends Control


func _ready() -> void:
	$Main/NewPC.connect("pressed", hover)


func hover():
	get_tree().change_scene_to_file("res://Scenes/ChooseNewPC.tscn")
