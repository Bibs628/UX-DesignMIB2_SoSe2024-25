extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$swoosh.play()
	$Control/Submit.pressed.connect(hover)
	$Control/Name.text_changed.connect(play_click_sound)

func hover():
	$TickSound.play()
	get_tree().change_scene_to_file("res://Scenes/Welcome.tscn")

func play_click_sound() -> void:
	$ClickSound.play()
