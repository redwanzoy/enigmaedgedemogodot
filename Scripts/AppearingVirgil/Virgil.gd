extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			print ("ok")
			#get_tree().change_scene("res://Scene/Level1.tscn")


func _on_Switch_Is_ActiveVirgil():
	$AnimationPlayer.play("appearing")
	yield($AnimationPlayer, "animation_finished")
	#$AnimationPlayer.play("opened")
