class_name Player
extends Character

const REPEAT_DIST = 2500
signal edge_reached
var ground_set = true
var relative_dist := 0
var is_hiding := false

onready var scope : RayCast2D = $Pivot/Scope
onready var radio_progress : TextureProgress = $UI/UIPivot/RadioProgress
onready var hidden_fade : ColorRect = $UI/UIPivot/HiddenFade
onready var hidden_label : Label = $UI/UIPivot/HiddenLabel
export var pickup_amount := 5

signal has_won
#signal has_lost
#signal hidden

signal enter_hide
signal leave_hide
signal pickup


func _ready() -> void:
	hidden_fade.visible = false
	print("EVEVE", Global.current_level)
	var _error = self.connect("has_won", Global.current_level, "go_to_win")
	_error = self.connect("has_lost", Global.current_level, "go_to_lose")
#	scope.clear_points()
#	scope.add_point(position)
#	scope.add_point(position + Vector2.RIGHT * 300)
	
	

#func _physics_process(delta: float) -> void:
#	._physics_process(delta)
#	if position.x > REPEAT_DIST + relative_dist and ground_set:
#		relative_dist += REPEAT_DIST
#		ground_set = false
#
#		emit_signal("edge_reached", Vector2.RIGHT, self)
#		ground_set = true 
#
#	elif position.x < -REPEAT_DIST + relative_dist and ground_set:
#		relative_dist -= REPEAT_DIST		
#		ground_set = false
#
#		emit_signal("edge_reached", Vector2.LEFT, self)
#
#		ground_set = true


func pick_up (item : String) -> void:
	match item:
		"":
			play_sound("pickup")
			radio_progress.value += radio_progress.max_value/pickup_amount
			radio_progress.get_node("TextProgress").text = String(floor(radio_progress.value)) + "%"
			if radio_progress.value >= radio_progress.max_value:
				emit_signal("has_won")
			else:
				emit_signal("pickup")
#func _on_GroundHolder_ground_set() -> void:
#	ground_set = true


func hide_behind(value := true):
	if value:
		emit_signal("enter_hide")
	elif is_hiding:
		emit_signal("leave_hide")
	is_hiding = value
	

func play_sound(audio : String) -> void:
	match audio:
		"pickup":
			$Audio/PickUp/PickUp1.play()
		_:
			.play_sound(audio)
