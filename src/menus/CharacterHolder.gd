extends HBoxContainer

export var path : String

onready var archer_type = preload("res://src/characters/Player.tscn")
onready var rifler_type = preload("res://src/characters/Player.tscn")
onready var flasher_type = preload("res://src/characters/Player.tscn")

#
#func _ready():
#	if not Global.character_selected_type: #ie none
#		Global.character_selected_type = archer_type
#	Global.current_character = archer_type.instance()
#	Global.current_character.position = player_spawn_point.position
#	$Characters.add_child(Global.current_character)

func _ready() -> void:
	pass

func _on_Archer_pressed() -> void:
	Global.character_selected_type = "archer_type"
	yield(get_tree().create_timer(1.0), "timeout")
	enter_game()

func _on_Rifler_pressed() -> void:
	Global.character_selected_type = "rifler_type"
	yield(get_tree().create_timer(1.0), "timeout")
	enter_game()

func _on_Flasher_pressed() -> void:
	Global.character_selected_type = "flasher_type"
	yield(get_tree().create_timer(1.0), "timeout")
	enter_game()

func enter_game():
	var _error = get_tree().change_scene(path)
