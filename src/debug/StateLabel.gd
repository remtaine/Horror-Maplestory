class_name StateLabel
extends Label


func _ready() -> void:
	pass


func _on_Character_state_changed(state) -> void:
	text = state.state_name
