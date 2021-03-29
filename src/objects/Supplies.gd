class_name Supplies
extends RigidBody2D

export var pickup_name := ""
#var picked_up := false

func _ready() -> void:
	pass


func _on_Supplies_body_entered(body: Node) -> void:
	if body.is_in_group("player") and body.has_method("pick_up"):
		body.pick_up(pickup_name)
		queue_free()
