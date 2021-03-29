class_name EnemyDead
extends Dead


func _ready() -> void:
	pass

func _on_Sprite_animation_finished() -> void:
#	print(owner.sprite.animation)
	pass

func enter():
	owner.sprite.modulate = Color.gray
	.enter()
