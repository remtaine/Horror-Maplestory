extends Node


func _ready() -> void:
	pass


func _on_PanelController_panel_activated() -> void:
	$PanelSwish.play()
