class_name Character
extends KinematicBody2D

var _state = null setget ,get_state
var is_flipped : bool = false
var possible_states : Dictionary = {}

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

onready var state_machine : Node = $StateMachine
onready var tween : Tween
onready var sprite : AnimatedSprite = $Pivot/Sprite
onready var pivot : Position2D = $Pivot

signal state_changed

func _ready():
	if state_machine != null:
		for child in state_machine.get_children():
			possible_states[child.state_name] = child
			if _state == null:
				_state = child


func _physics_process(_delta):
	var input = _state.get_raw_input()
	change_state(_state.interpret_inputs(input))
	_state.run(input)
		
		
func change_state(state_name, repeat = false):
	var new_state = possible_states[state_name]
	if _state != new_state or repeat:
		_state.exit()
		_state = new_state
		emit_signal("state_changed", _state)
		_state.enter()


func get_state():
	return _state
