class_name StaminaBar
extends TextureProgress

const DRAIN = 4
const ADD = 1
var is_active := false
var on_cd := false

onready var disappear_timer : Timer = $DisappearTimer

signal stamina_empty

func _ready() -> void:
	visible = false


func _process(_delta: float) -> void:
	if value == 0:
		emit_signal("stamina_empty")
		is_active = false
		on_cd = true
		$AnimationPlayer.play("blink")
		
	if is_active:
		value -= DRAIN
	elif value < max_value:
		value += ADD
	elif value >= max_value and disappear_timer.is_stopped():
		disappear_timer.start()
		
		
func _on_DisappearTimer_timeout() -> void:
	if value == max_value and not is_active:
		visible = false


func _on_Moving_run_ended() -> void:
	is_active = false


func _on_Moving_run_started() -> void:
	visible = true
	is_active = true


func _on_RunCD_timeout() -> void:
	on_cd = false
	$AnimationPlayer.stop()
