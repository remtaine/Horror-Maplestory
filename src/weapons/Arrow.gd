extends RigidBody2D

export var default_force := 200
var damage := 0


func _ready() -> void:
	pass


func setup(o) -> void:
	owner = o
	damage = owner.damage

func _on_Arrow_body_entered(body: Node) -> void:
	if body.is_in_group("enemies") and body.has_method("take_damage"):
		body.take_damage(damage)
