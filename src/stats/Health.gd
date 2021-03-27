class_name Health
extends Node

export var value := 4
export var max_value := 4

#signal attribute_depleted
signal attribute_changed


func _ready() -> void:
	owner = get_parent().get_parent()


func take_damage(v : int) -> void:
	if v == 0:
		return
		
	value = int(clamp(value - v, 0, max_value))
	print_debug(value)
	emit_signal("attribute_changed", self)
	
	if value <= 0:
#		emit_signal("attribute_depleted", self)
		owner.change_state("dead")
	else:
		owner.change_state("hurt")
