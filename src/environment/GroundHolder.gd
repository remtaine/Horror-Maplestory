class_name GroundHolder
extends Node2D

signal ground_set

func _ready() -> void:
	pass


func _on_Player_edge_reached(side : Vector2, player : KinematicBody2D) -> void:
	if side == Vector2.LEFT:
		var ground_left : TileMap = null
		for ground in get_children():
			if ground_left == null or ground_left.position.x < ground.position.x:
				ground_left = ground
		ground_left.position.x -= player.REPEAT_DIST * 3
		emit_signal("ground_set")
		
	elif side == Vector2.RIGHT:
		var ground_right : TileMap = null
		for ground in get_children():
			if ground_right == null or ground_right.position.x > ground.position.x:
				ground_right = ground
		ground_right.position.x += player.REPEAT_DIST * 3
		emit_signal("ground_set")
		
