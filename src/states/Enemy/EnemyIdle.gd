class_name EnemyIdle
extends Idle

func enter():
	$WaitTimer.start()
	.enter()


func _on_WaitTimer_timeout() -> void:
	owner.change_state("moving")

func exit():
	$WaitTimer.stop()
