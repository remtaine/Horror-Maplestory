class_name Jumping
extends State

func _ready():
	state_name = "jumping"


func enter() -> void:
	owner.sprite.play("falling")
	owner.velocity.y = -500

func run(inputs):
	owner.velocity.y += GRAVITY
	owner.move_and_slide(owner.velocity, Vector2.UP)
