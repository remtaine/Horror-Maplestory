extends Line2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	owner = get_parent().get_parent()


func _physics_process(_delta: float) -> void:
	if owner.is_colliding():
		if owner.get_parent().scale.x < 0: #ie flipped
			set_point_position(1, Vector2(-owner.get_collider().position.x, 0))
		else:
			set_point_position(1, Vector2(owner.get_collider().position.x, 0))

#		set_point_position(1, owner.get_collider().position.x, 0)
	else:
		set_point_position(1, Vector2(500, 0))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
