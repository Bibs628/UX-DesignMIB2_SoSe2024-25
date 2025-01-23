
#Change Parts


extends Control
@onready var scroll_container: ScrollContainer = %ScrollContainer
@onready var object_container: VBoxContainer = %SelectionContainer
@onready var pics_container: Control = %Pics

var targetScroll = 0
var prevSelec 

func _ready() -> void:
	$TextureRect/BackButton.pressed.connect(back)
	$ConfirmButton.pressed.connect(back)
	_set_selection()
	

func _set_selection():
	await get_tree().create_timer(0.01).timeout
	_select_deselect_highlight()

func _on_prev_pressed() -> void:
	$ButtonClick.play()
	var scrollValue = targetScroll - _get_space_between()
	if scrollValue < 0 : scrollValue = _get_space_between() * 5
	
	if scrollValue <= 0  : scrollValue = _get_space_between() * 6
	
	await _tween_scroll(scrollValue)
	
	_select_deselect_highlight()

func _on_next_pressed() -> void:
	$ButtonClick.play()
	var scrollValue = targetScroll + _get_space_between()
	if scrollValue > _get_space_between() * 5: scrollValue = 0
	
	if scrollValue >=  _get_space_between() * 6 : scrollValue = 0
	
	await _tween_scroll(scrollValue)
	
	_select_deselect_highlight()

func _get_space_between():
	var distanceSize = object_container.get_theme_constant("separation")
	var objectSize = object_container.get_children()[1].size.y
	
	return distanceSize + objectSize

func _tween_scroll(scrollValue):
	targetScroll = scrollValue
	
	var tween = get_tree().create_tween()
	tween.tween_property(scroll_container, "scroll_vertical", scrollValue, 0.25)
	await tween.finished

func _select_deselect_highlight():
	var selectedNode = get_selected_value()
	if selectedNode == null:
		selectedNode = %SelectionContainer.get_node("XPower")
	
	for pic in pics_container.get_children():
		pic.visible = pic == selectedNode
		for object in object_container.get_children():
			if object is not MarginContainer:
				object.modulate = Color(1, 1, 1) if object == selectedNode else Color(0, 0, 0)
				if object == selectedNode: 
					if object.name == pic.name: pic.visible = true
	prevSelec = selectedNode


func get_selected_value():
	var selectedPosition = %SelectionMarker.global_position
	
	for object in object_container.get_children():
		if object.get_global_rect().has_point(selectedPosition):
			return object
	

func back():
	print("back")
	$ButtonClick.play()
	get_tree().change_scene_to_file("res://Scenes/PrebuildConfig.tscn")
