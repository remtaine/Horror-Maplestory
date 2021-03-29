class_name Screenshake
extends Node2D

#note: change position at transform! not offset!
const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

onready var camera = get_parent()
onready var tween = $Tween
onready var frequency = $FrequencyTimer
onready var duration = $DurationTimer

var is_dead = false

var amplitude = 0
var priority = 0

func _ready():
	frequency.connect("timeout",self,"_on_FrequencyTimer_timeout")
	duration.connect("timeout",self,"_on_DurationTimer_timeout")

func start(p = 0, d = 0.3, f = 15, a = 18):
	
	if self.priority <= p:
		self.priority = p 
		self.amplitude = a + p * 3 
		$FrequencyTimer.set_wait_time(1.0/float(f * (1 + float(p)/10.0)))
		$DurationTimer.set_wait_time(d)
		
		$DurationTimer.start()
		$FrequencyTimer.start()
		
		_new_shake()
	
func _new_shake():
	var rand = Vector2()
	randomize()
	rand.x =  rand_range(-amplitude, amplitude)
	rand.y =  rand_range(-amplitude, amplitude)
	change_offset(rand)

func reset():
	change_offset(Vector2.ZERO)
	priority = 0

func change_offset(val):
	$Tween.interpolate_property(get_parent(), "offset", get_parent().offset, val, $FrequencyTimer.wait_time, TRANS, EASE)
	$Tween.start()
	
func _on_FrequencyTimer_timeout():
	_new_shake()

func _on_DurationTimer_timeout():
	reset()
	frequency.stop()


func _on_Scope_enemy_hit() -> void:
#	start()
	pass


func _on_AnimationPlayer_animation_started(anim_name: String) -> void:
	if anim_name != "setup" and not is_dead:
		start()


func _on_Health_is_dead() -> void:
	if not is_dead:
		start()
		is_dead = true
