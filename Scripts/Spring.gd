extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$AnimationPlayer.play("active")
			yield($AnimationPlayer,"animation_finished")
			#$AnimationPlayer.play("idle") idle sprite, active-er last sprite na thakle same ashbe na so use yield and recall it instead
		else:
			$AnimationPlayer.play("idle")
