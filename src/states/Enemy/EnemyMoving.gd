class_name EnemyMoving
extends Moving

var last_direction := Vector2.RIGHT
	
	
func enter() -> void:
	$MoveTimer.start()
	last_direction *= -1
	owner.direction = last_direction
	.enter()


func exit() -> void:
	$MoveTimer.stop()


func run(input):	
	owner.velocity.x = owner.direction.x * owner.speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1

	if not owner.is_flying:
		owner.velocity.y += GRAVITY
		
	owner.velocity = owner.move_and_slide(owner.velocity, Vector2.UP)


func _on_MoveTimer_timeout() -> void:
	owner.change_state("idle")
