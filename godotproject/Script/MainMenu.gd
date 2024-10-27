class_name MainMenu
extends Control

var MenuMain: VBoxContainer
var MenuSettings: VBoxContainer


func _ready() -> void:
	"""
	
	"""
	MenuMain = get_node("MenuMain")
	MenuSettings = get_node("MenuSettings")


func switch_menu(menu: int):
	"""
	
	"""
	for child in get_children():
		child.visible = not visible
	get_child(menu).visible = true


func quit_game():
	get_tree().quit()
