extends Resource
class_name SaveState

const SAVE_GAME_PATH = "user://save.tres"
@export var test = "hello world"


static func save_game():
	print("Saving game in " + SAVE_GAME_PATH)
	var save_data = SaveState.new()
	ResourceSaver.save(save_data, SAVE_GAME_PATH)


static func save_exists() -> bool:
	return ResourceLoader.exists(SAVE_GAME_PATH)


static func load_game():
	return load(SAVE_GAME_PATH)
