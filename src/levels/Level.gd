class_name Level
extends Node

export var menu_path := ""

func _ready():
	pass

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		var _status = get_tree().reload_current_scene()
	elif event.is_action_pressed("menu") and menu_path != "":
		var _status = get_tree().change_scene(menu_path)
	elif event.is_action_pressed("debug"):
		var _status = get_tree().call_group("debug", "toggle")
