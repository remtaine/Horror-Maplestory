class_name Falling
extends State

func _ready():
	state_name = "falling"


func enter() -> void:
	owner.sprite.play("falling")

#func exit() -> void:
#	owner.velocity.y = 0

func run(inputs):
#	owner.velocity.x = lerp(owner.velocity.x, 0, 0.3)
	.run(inputs)
