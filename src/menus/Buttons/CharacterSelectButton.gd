class_name CharacterSelectButton
extends VBoxContainer

export var autofocus := false
onready var character_name : Label = $Name
var default_name : String
var is_active = false

func _ready() -> void:
	default_name = character_name.text
	if autofocus:
		$Character.grab_focus()


func _on_Character_focus_entered() -> void: #focus
	character_name.text = "> " + default_name


func _on_Character_focus_exited() -> void: #unfocus
	character_name.text = default_name
	$Audio/Selected.play()

func _on_Character_mouse_entered() -> void: #hover
	pass # Replace with function body.


func _on_Character_mouse_exited() -> void: #unhover
	pass # Replace with function body.


func _on_Character_pressed() -> void:
	if not is_active:
		$Audio/Clicked.play()
#	$AnimationPlayer.playback_speed = 10.0
		is_active = true
