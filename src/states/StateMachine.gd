class_name StateMachine
extends Node


func _ready() -> void:
	owner = get_parent()


func get_raw_input() -> Dictionary:
	var inputs := {
		is_moving = get_input_direction().length_squared() != 0,
		input_direction = get_input_direction(),
		is_attacking = Input.is_action_pressed("attack"),
		is_jumping = Input.is_action_just_pressed("jump"),
	}
	return inputs


func interpret_inputs(input):
	var state_name = owner.get_state().state_name
	if owner.is_in_group("player"):
		print(state_name)
		
	if state_name == "dead":
		return "dead"
	elif state_name == "hurt":
		return "hurt"
	elif state_name == "attacking" or input.is_attacking:
		return "attacking"
		
	elif (owner.is_on_floor() and input.is_jumping) or owner.velocity.y < 0:
		return "jumping"
	elif not owner.is_on_floor() and not owner.is_flying:
		return "falling"
	
	elif input.is_moving:
		return "moving"
	else:
		return "idle"


func get_input_direction() -> Vector2:
	return Vector2(float(Input.is_action_pressed("ui_right")) - float(Input.is_action_pressed("ui_left")), 0)
#	float(Input.is_action_pressed("ui_down")) - float(Input.is_action_pressed("ui_up")))

