class_name EnemyDead
extends Dead

const GRAY_TONE = 0.5

func _ready() -> void:
	pass

	
func enter():
	owner.sprite.modulate = Color(GRAY_TONE, GRAY_TONE, GRAY_TONE)
	.enter()


func _on_Sprite_animation_finished() -> void:
#	print(owner.sprite.animation)
#	if owner.sprite.animation == "dead":
#		owner.queue_free()
	pass
