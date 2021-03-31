class_name Hitbox
extends Area2D

export (String, "player", "enemies") var target_group := "player"

func _ready() -> void:
	deactivate()

func activate() -> void:
	$CollisionShape2D.disabled = false	


func deactivate() -> void:
	$CollisionShape2D.disabled = true	


func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group(target_group) and not body.is_dead and body.has_method("take_damage"):
		body.take_damage(owner.damage)


func _on_Attacking_start_damage() -> void:
	activate()


func _on_Attacking_end_damage() -> void:
	deactivate()
