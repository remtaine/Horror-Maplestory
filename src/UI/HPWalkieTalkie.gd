class_name HPWalkieTalkie
extends AnimatedSprite


func _ready() -> void:
	pass


func _on_Health_attribute_changed(attribute : Node) -> void:
	#attribute.value
	play(String(attribute.value))
