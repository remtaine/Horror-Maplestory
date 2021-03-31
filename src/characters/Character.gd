class_name Character
extends KinematicBody2D

export var is_flying := false
export var damage := 1
var speed := 0
var _state : State = null setget ,get_state
var is_flipped : bool = false
var possible_states : Dictionary = {}

var is_dead = false
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
				_state.enter()

func _physics_process(_delta):
#	if _state.state_name != "dead":
	var input = _state.get_raw_input()
	if not is_dead:
		change_state(_state.interpret_inputs(input))
	_state.run(input)
		
	if position.y > 2000:
		change_state("dead")
		
func change_state(state_name, repeat = false):
	var new_state = possible_states[state_name]
	if _state.state_name == "dead":
		return
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
		"attacking":
			sound_holder = $Audio/Attacking
	sound_holder.get_child(randi() % sound_holder.get_child_count()).play()


func take_damage(value : int) -> void:
	if not is_dead:
		hp.take_damage(value)


func _on_Health_is_dead() -> void:
	is_dead = true
