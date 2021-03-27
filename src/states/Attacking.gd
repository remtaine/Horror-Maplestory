class_name Attacking
extends State

signal attack_launched

func _ready():
	state_name = "attacking"


func enter() -> void:
	owner.play_sound("attacking")
	owner.sprite.play("attacking")
	emit_signal("attack_launched")
	
	
func run(inputs):
	if owner.is_on_floor():
		owner.velocity.x = lerp(owner.velocity.x, 0, 0.05)
	.run(inputs)


func _on_Sprite_animation_finished() -> void:
	if owner.sprite.animation == "attacking":
		owner.change_state("idle")
