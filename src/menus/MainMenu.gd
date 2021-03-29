class_name MainMenu
extends Control

onready var version_label : Label = $CanvasLayer/UIControl/PanelController/CreditsPanel/Version


func _ready() -> void:
	version_label.text = Global.version

