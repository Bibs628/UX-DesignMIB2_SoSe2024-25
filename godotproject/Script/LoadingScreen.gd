"""
Loads a new scene.
Must have target_scene specified.
"""
class_name LoadingScreen
extends CenterContainer

static var target_scene: String
var loading_status: int
var progress: Array[float]

@onready var progress_bar := $ProgressBar


func _ready() -> void:
	print("Loading scene ", target_scene)
	ResourceLoader.load_threaded_request(target_scene)


func _process(_delta):
	loading_status = ResourceLoader.load_threaded_get_status(target_scene, progress)
	progress_bar.value = progress[0] * 100

	if loading_status == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(target_scene))
