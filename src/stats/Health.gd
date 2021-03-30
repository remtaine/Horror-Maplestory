class_name Health
extends Node

export var value := 4
var max_value := 4

#signal attribute_depleted
signal attribute_changed
signal is_dead
signal is_hurt

func _ready() -> void:
	owner = get_parent().get_parent()
	max_value = value

func take_damage(v : int) -> void:
	if v == 0:
		return
		
	value = int(clamp(value - v, 0, max_value))
	print_debug(value)
	emit_signal("attribute_changed", self)
	
	if value >= 1:
		emit_signal("is_hurt")
		owner.change_state("hurt")
	else:
#		emit_signal("attribute_depleted", self)
		emit_signal("is_dead")
		owner.change_state("dead")	
