class_name Level
extends Node

export var path := ""
var path_win = "res://src/menus/WinMenu.tscn"
var path_lose = "res://src/menus/LoseMenu.tscn"

onready var player_spawn_point : Position2D = $PlayerSpawnPoint

onready var archer_type = preload("res://src/characters/Archer.tscn")
onready var rifler_type = preload("res://src/characters/Rifler.tscn")
onready var flasher_type = preload("res://src/characters/Player.tscn")



func _ready():
	Global.current_level = self
	if Global.character_selected_type == "": #ie none
		Global.character_selected_type = "archer_type"
#	Global.character_selected_type = archer_type
	
#	yield(self, "ready")
	Global.current_character = get(Global.character_selected_type).instance()
	Global.current_character.position = player_spawn_point.position
	$Characters.add_child(Global.current_character)

func _unhandled_input(event):
	if event.is_action_pressed("reset"):
		var _error = get_tree().reload_current_scene()
	elif event.is_action_pressed("menu") and path != "":
		SceneChanger.change_scene(path)
#		var _error = get_tree().change_scene(path)
	elif event.is_action_pressed("debug"):
		var _error = get_tree().call_group("debug", "toggle")


func go_to_win() -> void:
#	var _error = get_tree().change_scene(path_win)
	SceneChanger.change_scene(path_win)
	
func go_to_lose() -> void:
#	var _error = get_tree().change_scene(path_lose)
	SceneChanger.change_scene(path_lose)
