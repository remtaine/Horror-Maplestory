extends Label


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	text = "FPS: " + str(Engine.get_frames_per_second())
