class_name Health
extends Node

export var value := 100
export var max_value := 100

#signal attribute_depleted
#signal attribute_changed

func _ready() -> void:
	owner = get_parent().get_parent()


func take_damage(v : int) -> void:
	value = clamp(value - v, 0, max_value)
	print(value)
	if value <= 0:
#		emit_signal("attribute_depleted", self)
		owner.change_state("dead")
	else:
#		emit_signal("attribute_changed", self)
		owner.change_state("hurt")
