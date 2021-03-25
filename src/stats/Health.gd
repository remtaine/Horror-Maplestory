class_name Health
extends Attribute


func _ready() -> void:
	pass


func take_damage(v : int) -> void:
	set_value(value - v)
