class_name Attacking
extends State

func _ready():
	state_name = "attacking"


func enter() -> void:
	owner.sprite.play("attacking")
	
func run(inputs):
	owner.velocity.x = lerp(owner.velocity.x, 0, 0.3)
	.run(inputs)


func _on_Sprite_animation_finished() -> void:
	if owner.sprite.animation == "attacking":
		owner.change_state("idle")
