class_name PlayerAttacking
extends Attacking


func _ready() -> void:
	pass
	
	
func enter() -> void:
	if owner.is_hiding:
		owner.hide_behind(false)
	.enter()
