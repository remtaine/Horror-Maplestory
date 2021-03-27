class_name Level
extends Node

export var path := ""

onready var player_spawn_point : Position2D = $PlayerSpawnPoint

onready var archer_type = preload("res://src/characters/Archer.tscn")
onready var rifler_type = preload("res://src/characters/Rifler.tscn")
onready var flasher_type = preload("res://src/characters/Player.tscn")


func _ready():
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
		var _error = get_tree().change_scene(path)
	elif event.is_action_pressed("debug"):
		var _error = get_tree().call_group("debug", "toggle")
