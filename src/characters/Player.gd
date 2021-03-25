class_name Player
extends Character

const REPEAT_DIST = 2560

signal edge_reached


func _process(delta: float) -> void:
	._process(delta)
	
	if position.x > REPEAT_DIST:
		emit_signal("edge_reached", Vector2.RIGHT)
	elif position.x < -REPEAT_DIST:
		emit_signal("edge_reached", Vector2.LEFT)
