extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$AnimationPlayer.play("revealed")
			yield($AnimationPlayer,"animation_finished")
		else:
			$AnimationPlayer.play("hidden")
