extends Button

var is_active := false
export var is_arrowable := true
export var path : String = ""
export (String, "scene", "panel") var button_use = "scene"
export var autofocus := false

var default_text : String

onready var tween : Tween = $Tween


func _ready() -> void:
	var _error = self.connect("pressed", self, "activate")
	default_text = text
	if autofocus:
		grab_focus()

func activate():
	if button_use == "scene":
		if not is_active:
			click_effect()
			yield(get_tree().create_timer(1.0), "timeout")
			if path != "":
#				var _status = get_tree().change_scene(path)
				SceneChanger.change_scene(path)
	elif button_use == "panel":
		click_effect(false)
		yield(get_tree().create_timer(1.0), "timeout")
		$AnimationPlayer.playback_speed = 1.0

func click_effect(blink := true) -> void:
	if button_use == "scene":
		$AnimationPlayer.playback_speed = 10.0
	$Audio/Clicked.play()
	is_active = true	
	
	#TODO add clicked sound
	#TODO move path


func _on_MainMenuButton_focus_exited() -> void:
	if is_arrowable:
		text =  default_text
#		if button_use == "panel":
		$Audio/Focused.play()

func _on_MainMenuButton_focus_entered() -> void:
	if is_arrowable:
		text =  "> " + default_text
	

func _on_MainMenuButton_mouse_entered() -> void:
	var _error = tween.interpolate_property(self, "rect_scale:x", rect_scale.x, 1.04, 0.4)
	_error = tween.start()


func _on_MainMenuButton_mouse_exited() -> void:
	var _error = tween.interpolate_property(self, "rect_scale:x", rect_scale.x, 1.0, 0.4)
	_error = tween.start()



