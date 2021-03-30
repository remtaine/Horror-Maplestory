class_name EnemyJumping
extends Jumping


func run(inputs):
#	owner.direction = inputs.input_direction.normalized()
	owner.velocity.x = owner.direction.x * owner.speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1	
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1
	if not owner.is_flying:
		owner.velocity.y += GRAVITY
	owner.velocity = owner.move_and_slide(owner.velocity, Vector2.UP)
	
#	owner.velocity.y += GRAVITY
#	owner.move_and_slide(owner.velocity, Vector2.UP)
