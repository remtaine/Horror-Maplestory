extends Button

var is_active := false
export var path : String = ""


func _ready() -> void:
	self.connect("pressed", self, "activate")


func activate():
	if not is_active:
		$AnimationPlayer.playback_speed = 10.0
		is_active = true
		#TODO add clicked sound
		#TODO move path
		yield(get_tree().create_timer(1.0), "timeout")
		if path != "":
			var _status = get_tree().change_scene(path)
