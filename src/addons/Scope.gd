class_name Scope
extends RayCast2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	owner = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Attacking_attack_launched() -> void:
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("enemies") and collider.has_method("take_damage"):
			collider.take_damage(1)
