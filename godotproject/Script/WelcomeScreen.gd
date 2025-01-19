extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Main/NewPC.connect("mouse_entered", hover)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hover():
	print("hi")
