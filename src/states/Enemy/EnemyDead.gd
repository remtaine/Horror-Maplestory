class_name EnemyDead
extends Dead

const GRAY_TONE = 0.5

func _ready() -> void:
	pass

	
func enter():
	owner.sprite.modulate = Color(GRAY_TONE, GRAY_TONE, GRAY_TONE)
	owner.set_collision_layer(0)
	owner.set_collision_mask(1)
	.enter()


func _on_Sprite_animation_finished() -> void:
#	print(owner.sprite.animation)
#	if owner.sprite.animation == "dead":
#		owner.queue_free()
	pass
