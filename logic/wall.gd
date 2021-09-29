extends Area2D

signal lost_ball

func _on_area_entered(area):
	if area.name == "Ball":
		#oops, ball went out of game place, reset
		area.reset()
		emit_signal("lost_ball")
