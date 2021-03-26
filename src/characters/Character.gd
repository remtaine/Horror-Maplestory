class_name Character
extends KinematicBody2D

var _state : State = null setget ,get_state
var is_flipped : bool = false
var possible_states : Dictionary = {}

var velocity := Vector2.ZERO
var direction := Vector2.ZERO

onready var state_machine : Node = $StateMachine
onready var tween : Tween
onready var sprite : AnimatedSprite = $Pivot/Sprite
onready var pivot : Position2D = $Pivot
onready var hp : Node = $Attributes/Health

signal state_changed

func _ready():
	if state_machine != null:
		for child in state_machine.get_children():
			possible_states[child.state_name] = child
			if _state == null:
				_state = child


func _physics_process(_delta):
#	if _state.state_name != "dead":
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


func play_sound(audio : String) -> void:
	randomize()
	var sound_holder : Node
	match audio:
		"moving":
			sound_holder = $Audio/Footsteps
		"landing":
			sound_holder = $Audio/Landing
	sound_holder.get_child(randi() % sound_holder.get_child_count()).play()

func take_damage(value : int) -> void:
	hp.take_damage(value)
