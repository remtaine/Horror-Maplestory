class_name EnemyStateMachine
extends StateMachine


func get_raw_input() -> Dictionary:
	var inputs := {
		is_moving = false,
		input_direction = false,
		is_attacking = false,
		is_jumping = false,
	}
	return inputs

#func get_input_direction() -> Vector2:
#	return Vector2(float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")), 0)
