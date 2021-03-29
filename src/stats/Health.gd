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
	
	if value <= 0:
#		emit_signal("attribute_depleted", self)
		owner.change_state("dead")
		emit_signal("is_dead")
	else:
		owner.change_state("hurt")
		emit_signal("is_hurt")
		
