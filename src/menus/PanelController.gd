class_name PanelController
extends Control

const HIDDEN_PANEL_POS_X = -1000.0
var selected_panel_pos_x : float

onready var selected_panel : ColorRect = $BlankPanel

signal panel_activated

func _ready() -> void:
	setup_panels()
	

func setup_panels() -> void:
	for panel in get_children():
		if panel != selected_panel:
			panel.rect_position.x = HIDDEN_PANEL_POS_X
		else:
			selected_panel_pos_x = panel.rect_position.x

func activate_panel(panel : ColorRect) -> void:
	if panel == selected_panel:
		activate_panel($BlankPanel)
		return
	
	emit_signal("panel_activated")	
		
	panel.get_node("Tween").interpolate_property(panel, "rect_position:x", panel.rect_position.x, selected_panel_pos_x, 0.4)#, trans_type: TransitionType = 0, ease_type: EaseType = 2, delay: float = 0)
	selected_panel.get_node("Tween").interpolate_property(selected_panel, "rect_position:x", selected_panel.rect_position.x, HIDDEN_PANEL_POS_X, 0.4)#, trans_type: TransitionType = 0, ease_type: EaseType = 2, delay: float = 0)
	
	panel.get_node("Tween").start()
	selected_panel.get_node("Tween").start()
	
#	panel.rect_position.x = selected_panel.rect_position.x
#	selected_panel.rect_position.x = HIDDEN_PANEL_POS_X
	selected_panel = panel


func _on_Instructions_pressed() -> void:
	activate_panel($InstructionsPanel)


func _on_Options_pressed() -> void:
	activate_panel($OptionsPanel)


func _on_Credits_pressed() -> void:
	activate_panel($CreditsPanel)
