class_name PlayerDead
extends Dead

export var sprite_excess := 0

func _on_Sprite_animation_finished() -> void:
#	print(owner.sprite.animation)
	if owner.sprite.animation == "dead":
		yield(get_tree().create_timer(1.0), "timeout")
		Global.current_level.go_to_lose()


func enter() -> void:
	owner.sprite.position.y -= sprite_excess
	.enter()
	
