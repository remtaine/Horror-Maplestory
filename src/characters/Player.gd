class_name Player
extends Character

const REPEAT_DIST = 2500
signal edge_reached
var ground_set = true
var relative_dist := 0

onready var scope : RayCast2D = $Pivot/Scope


#func _ready() -> void:
#	scope.clear_points()
#	scope.add_point(position)
#	scope.add_point(position + Vector2.RIGHT * 300)
	
	

func _physics_process(delta: float) -> void:
	._physics_process(delta)
	if position.x > REPEAT_DIST + relative_dist and ground_set:
		relative_dist += REPEAT_DIST
		ground_set = false

		emit_signal("edge_reached", Vector2.RIGHT, self)
		ground_set = true 

	elif position.x < -REPEAT_DIST + relative_dist and ground_set:
		relative_dist -= REPEAT_DIST		
		ground_set = false

		emit_signal("edge_reached", Vector2.LEFT, self)

		ground_set = true


#func _on_GroundHolder_ground_set() -> void:
#	ground_set = true
