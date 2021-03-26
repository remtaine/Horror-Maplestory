class_name Level
extends Node

export var path := ""

func _ready():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		var _status = get_tree().reload_current_scene()
	elif event.is_action_pressed("menu") and path != "":
		var _status = get_tree().change_scene(path)
	elif event.is_action_pressed("debug"):
		var _status = get_tree().call_group("debug", "toggle")
