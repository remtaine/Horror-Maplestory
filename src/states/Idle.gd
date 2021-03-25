class_name Idle
extends State

func _ready():
	state_name = "idle"


func enter() -> void:
	owner.sprite.play("idle")
	
func run(inputs):
	owner.velocity.x = lerp(owner.velocity.x, 0, 0.3)
	.run(inputs)
