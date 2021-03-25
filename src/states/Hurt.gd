class_name Hurt
extends State

func _ready():
	state_name = "hurt"


func enter() -> void:
	owner.sprite.play("hurt")
#	emit_signal("attack_launched")
	
	
func run(inputs):
	owner.velocity.x = lerp(owner.velocity.x, 0, 0.05)
	.run(inputs)


func _on_Sprite_animation_finished() -> void:
	if owner.sprite.animation == "hurt":
		owner.change_state("idle")
