class_name HiddenDecor
extends Node2D

onready var hide_timer : Timer = $HideTimer
var current_body : Player


func _ready() -> void:
	owner = get_parent()



func _on_HiddenDecor_body_entered(body: Node) -> void:
	if body.has_method("hide_behind"):
		print(body.name)
		current_body = body
		hide_timer.start()


func _on_HideTimer_timeout() -> void:
	current_body.hide_behind()


func _on_HiddenDecor_body_exited(body: Node) -> void:
	hide_timer.stop()
	if body.has_method("hide_behind"):
		body.hide_behind(false)
