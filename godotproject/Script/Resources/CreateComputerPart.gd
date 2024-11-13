"""
Basic script to create computer parts with.
"""
# TODO: This is a mere test.
extends Node

@onready var json_file := "res://Assets/JSONPCParts/case-accessory.json"
@onready var json_text := FileAccess.get_file_as_string(json_file)
@onready var json_dict = JSON.parse_string(json_text)
@onready var resource := ComputerParts.new()

func _ready() -> void:
	for part in json_dict:
		var case_accessory := CaseAccessory.new()
		case_accessory.name = part.get("name", "")
		case_accessory.price = part.get("price") if typeof(part.get("price")) in [TYPE_INT, TYPE_FLOAT] else 0
		case_accessory.type = part.get("type", "")
		case_accessory.form_factor = part.get("form_factor", "")
		resource.parts.append(case_accessory)

	ResourceSaver.save(resource, "res://Script/Resources/ComputerParts/Test/test.tres")
