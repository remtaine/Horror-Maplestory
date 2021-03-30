class_name EnemyChasing
extends EnemyMoving

export var speed_multiplier := 1.5

func _ready() -> void:
	state_name = "chasing"


func enter() -> void:
	owner.direction = owner.position.direction_to(Global.current_character.position)
	if owner.sprite.animation != "moving":
		owner.sprite.play("moving")
#	owner.velocity.y = 0
	owner.speed *= speed_multiplier


func exit() -> void:
	owner.speed /= speed_multiplier
