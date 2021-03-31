class_name SplashScreen
extends Control

export var path := ""
export var is_skippable := false

onready var label : Label = $Label


func _ready() -> void:		
	if OS.get_name() != "HTML5":
		label.text = "Thank you for playing the downloadable game, which provides a more immersive experience"
	else:
		is_skippable = false

	if is_skippable:
		var _error = get_tree().change_scene(path)	
			
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	var _error = get_tree().change_scene(path)
