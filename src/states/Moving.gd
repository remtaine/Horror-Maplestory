class_name Moving
extends State

export var speed : int = 220

onready var tween : Tween = $Tween
onready var run_cd : Timer = $RunCD

signal run_started
signal run_ended


func _ready():
	owner.speed = self.speed
	state_name = "moving"
	owner = get_parent().get_parent()
	
func run(input):
	if Input.is_action_pressed("run") and run_cd.is_stopped():
		owner.speed = 2 * speed
		emit_signal("run_started")
	else:
		owner.speed = speed
		emit_signal("run_ended")
		
	
	owner.direction = input.input_direction.normalized()
	owner.velocity.x = owner.direction.x * owner.speed

	if owner.velocity.x < 0:
		owner.pivot.scale.x = -1	
	elif owner.velocity.x > 0:
		owner.pivot.scale.x = 1
	.run(input)
	

func enter() -> void:
	if owner.sprite.animation != "moving":
		owner.sprite.play("moving")
	owner.velocity.y = 0

func _on_Sprite_frame_changed() -> void:
	if owner.sprite != null and owner.sprite.animation == "moving" and (owner.sprite.frame == 1 or owner.sprite.frame == 4):
		owner.play_sound("moving")


func _on_StaminaBar_stamina_empty() -> void:
	owner.speed = speed
	run_cd.start()
