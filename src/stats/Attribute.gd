class_name Attribute
extends Node

export var value := 100 setget set_value
export var max_value := 100

signal attribute_depleted


func _ready() -> void:
	pass


func set_value(v : int) -> void:
	value = clamp(v, 0, max_value)
	emit_signal("attribute_depleted", self)
