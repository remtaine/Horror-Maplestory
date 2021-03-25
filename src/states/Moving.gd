class_name Moving
extends State

export var speed : int = 220
var last_direction : Vector2 = Vector2.ZERO

onready var tween : Tween = $Tween

func _ready():
	state_name = "moving"
	owner = get_parent().get_parent()

func run(input):

	owner.direction = input.input_direction.normalized()
	owner.velocity.x = owner.direction.x * speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1	
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1
	.run(input)
	

func enter() -> void:
	owner.sprite.play("moving")
	owner.velocity.y = 0
