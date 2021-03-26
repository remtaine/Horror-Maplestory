class_name State
extends Node

const GRAVITY = 8

var state_name := "State"
onready var state_machine : Node = get_parent()


var inputs = {
		is_moving = false,
		input_direction = Vector2.ZERO,
		is_shooting = false,
	}
	
	
func _ready() -> void:
	owner = get_parent().get_parent()
	
	
func get_raw_input() -> Dictionary:
	if state_machine.has_method("get_raw_input"):
		return state_machine.get_raw_input()
	return {}
	
	
func interpret_inputs(input):
	if state_machine.has_method("interpret_inputs"):
		return state_machine.interpret_inputs(input)
	return ""


func enter():
	pass


func exit():
	pass


func run(_input):
	#TODO ADD GRAVITY
	if not owner.is_flying:
		owner.velocity.y += GRAVITY
	owner.velocity = owner.move_and_slide(owner.velocity, Vector2.UP)
#	if owner.is_on_floor():
#		owner.velocity.y = 0
