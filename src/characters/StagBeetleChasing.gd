class_name StagBeetleChasing
extends EnemyChasing


func enter() -> void:
	owner.direction = owner.position.direction_to(Global.current_character.position)
	if owner.sprite.animation != "moving":
		owner.sprite.play("moving")
#	owner.velocity.y = 0
	owner.speed *= speed_multiplier


func exit() -> void:
	owner.speed /= 2

func run(input):	
	owner.velocity = owner.direction * owner.speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1
		
	owner.velocity = owner.move_and_slide(owner.velocity, Vector2.UP)
