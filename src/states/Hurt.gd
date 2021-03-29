class_name Hurt
extends State

func _ready():
	state_name = "hurt"


func enter() -> void:
	if owner.sprite.animation != "hurt":
		owner.sprite.play("hurt")
		$AnimationPlayer.play("blink")
#	emit_signal("attack_launched")
	

func exit() -> void:
	$AnimationPlayer.play("setup")
	
	
func run(inputs):
	owner.velocity.x = lerp(owner.velocity.x, 0, 0.05)
	.run(inputs)


#func _on_Sprite_animation_finished() -> void:
#	if owner.sprite.animation == "hurt":
		


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	owner.change_state("idle")
