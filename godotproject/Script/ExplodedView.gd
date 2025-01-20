extends Control


func _ready() -> void:
	$AnimationPlayer.play("Explode")
	$AudioStreamPlayer.play()
