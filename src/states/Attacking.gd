class_name Attacking
extends State

export var start_damage_frame := -1
export var end_damage_frame := -1

signal attack_launched
signal start_damage
signal end_damage

func _ready():
	state_name = "attacking"


func enter() -> void:
	owner.play_sound("attacking")
	
	if owner.sprite.animation != "attacking":
		owner.sprite.play("attacking")
	emit_signal("attack_launched")
	
	
func exit() -> void:
	emit_signal("end_damage")
	if $Timer != null: #while this timer is started, character can't attack
		$Timer.start()
	
	
func run(inputs):
	#reduced friction
	if owner.is_on_floor():
		owner.velocity.x = lerp(owner.velocity.x, 0, 0.05)
	.run(inputs)


func _on_Sprite_animation_finished() -> void:
	if owner.sprite.animation == "attacking":
		owner.change_state("idle")


func _on_Sprite_frame_changed() -> void:
	
	if owner.sprite != null and owner.sprite.animation == "attacking":
		if owner.sprite.frame == start_damage_frame:
			emit_signal("start_damage")
		elif owner.sprite.frame == end_damage_frame:
			emit_signal("end_damage")
		
