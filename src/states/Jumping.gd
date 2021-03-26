class_name Jumping
extends State

const JUMP_SPEED := 320
func _ready():
	state_name = "jumping"


func enter() -> void:
	owner.sprite.play("falling")
	owner.velocity.y = -JUMP_SPEED

func run(inputs):
	owner.direction = inputs.input_direction.normalized()
	owner.velocity.x = owner.direction.x * owner.speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1	
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1
	.run(inputs)
	
#	owner.velocity.y += GRAVITY
#	owner.move_and_slide(owner.velocity, Vector2.UP)
