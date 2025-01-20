"""
Loads a new scene.
Must have target_scene specified.
"""
class_name LoadingScreen
extends Control

static var target_scene: String
var loading_status: int
var progress: Array[float]
var timer_has_started: bool = false


func _ready() -> void:
	print("Loading scene ", target_scene)
	ResourceLoader.load_threaded_request(target_scene)
	$Timer.timeout.connect(switch_to_scene)


func _process(_delta):
	loading_status = ResourceLoader.load_threaded_get_status(target_scene, \
	progress)

	if loading_status == ResourceLoader.THREAD_LOAD_LOADED \
	and not timer_has_started:
		$Timer.start()
		$AnimationPlayer.play("Loading")
		timer_has_started = true


func switch_to_scene():
	get_tree().change_scene_to_packed( \
	ResourceLoader.load_threaded_get(target_scene))
