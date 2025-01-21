
#Prebuild Selection

extends Control

@onready var scroll_container: ScrollContainer = %ScrollContainer
@onready var object_container: VBoxContainer = %SelectionContainer

var targetScroll = 0
var prevSelec 

func _ready() -> void:
	$SelectButton.pressed.connect(hover)
	$BackButton/backButton.pressed.connect(back)
	_set_selection()
	

func _set_selection():
	await get_tree().create_timer(0.01).timeout
	_select_deselect_highlight()

func _on_prev_pressed() -> void:
	var scrollValue = targetScroll - _get_space_between()
	if scrollValue < 0 : scrollValue = _get_space_between() * 5
	
	if scrollValue <= 0  : scrollValue = _get_space_between() * 6
	
	await _tween_scroll(scrollValue)
	
	_select_deselect_highlight()

func _on_next_pressed() -> void:
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
	
	for object in object_container.get_children():
		if object == prevSelec:
			# object.size.y = object.size.y / 2
			object.get_child(1).visible = false
			
		if object == selectedNode: 
			object.modulate = Color(1,1,1)
			$Selection.text = "     " + object.text
			# object.size.y = object.size.y * 2
			object.get_child(1).visible = true
			
		else: 
			object.modulate = Color(0,0,0)
			# object.position.y += object.size.y
	
	prevSelec = selectedNode

func get_selected_value():
	var selectedPosition = %SelectionMarker.global_position
	
	for object in object_container.get_children():
		if object.get_global_rect().has_point(selectedPosition):
			return object


func hover():
	var loading_screen = LoadingScreen.new()
	loading_screen.target_scene = "res://Scenes/PrebuildConfig.tscn"
	get_tree().change_scene_to_file("res://Scenes/LoadingScreen.tscn")


func back():
	print("back")
	get_tree().change_scene_to_file("res://Scenes/ChooseNewPC.tscn")
