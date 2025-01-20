extends Control


func _ready() -> void:
	$Submit.pressed.connect(switch_to_main)
	$AudioStreamPlayer.play()
	$RichTextLabel/RememberMe.pressed.connect(play_tick_sound)
	$EMail.text_changed.connect(play_click_sound)
	$Password.text_changed.connect(obfuscate_password)


func switch_to_main() -> void:
	play_click_sound()
	OS.delay_msec(50)
	get_tree().change_scene_to_file("res://Scenes/Welcome.tscn")


func play_click_sound() -> void:
	$ClickSound.play()


func play_tick_sound() -> void:
	$TickSound.play()


func obfuscate_password() -> void:
	play_click_sound()
	var text_length := len($Password.text)
	for i in text_length - 1:
		$Password.text[i] = '⚫'
