class_name EnemyStateMachine
extends StateMachine

export var attack_dist := 50
export var chase_dist := 300



func get_raw_input() -> Dictionary:
	return {}


func interpret_inputs(_input):
	var state_name = owner.get_state().state_name
	if state_name == "dead":
		return "dead"
	if state_name == "hurt":
		return "hurt"
	elif not owner.is_flying and not owner.is_on_floor():
		return "falling"
	elif $Attacking/Timer.is_stopped() and not Global.current_character.is_hiding and (abs(owner.position.x - Global.current_character.position.x) < attack_dist or state_name == "attacking"):
		return "attacking"
	elif not Global.current_character.is_hiding and abs(owner.position.x - Global.current_character.position.x) < chase_dist:
		return "chasing"
	#if near enemy: return chasing	
	elif state_name == "moving":
		return "moving"
	else:
		return "idle"
	#
	
#	return state_name
#	elif state_name == "attacking" or input.is_attacking:
#		return "attacking"
#
#	if (owner.is_on_floor() and input.is_jumping) or owner.velocity.y < 0:
#		return "jumping"
#	elif not owner.is_on_floor() and not owner.is_flying:
#		return "falling"
#


#func get_input_direction() -> Vector2:
#	return Vector2(float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")), 0)
