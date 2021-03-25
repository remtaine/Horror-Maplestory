class_name Dead
extends State

var is_gone = false

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	state_name = "dead"

func enter():
	owner.sprite.play("dead")


func _on_Sprite_animation_finished() -> void:
#	print(owner.sprite.animation)
	if owner.sprite.animation == "dead":
		owner.queue_free()
