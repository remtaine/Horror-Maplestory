class_name HiddenFade
extends ColorRect

onready var hidden_label : Label = $HiddenLabel

func _ready() -> void:
	pass


func _on_Player_enter_hide() -> void:
	visible = true
	hidden_label.visible = true
	$AnimationPlayer.play("hide")
	

func _on_Player_leave_hide() -> void:
	$AnimationPlayer.play_backwards("hide")
#	visible = false
	hidden_label.visible = false


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	print(anim_name)
