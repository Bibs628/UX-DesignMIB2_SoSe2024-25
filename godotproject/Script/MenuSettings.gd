class_name MenuSettings
extends BoxContainer


var back_to_menu: MenuButton


func _ready():
	back_to_menu = $BackToMenu
	back_to_menu.pressed.connect(back_to_main_menu)


func back_to_main_menu():
	visible = not visible


func on_switch_to_settings():
	visible = not visible
