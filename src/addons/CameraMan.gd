extends Camera2D


func _ready() -> void:
	owner = get_parent()


func _process(delta: float) -> void:
	position.x = lerp(position.x, owner.position.x, 0.2)
