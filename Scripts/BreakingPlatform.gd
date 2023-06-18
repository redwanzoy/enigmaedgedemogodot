extends Area2D

onready var animplatform = $AnimationPlayer




func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			animplatform.play ("destroyed")
			yield(animplatform, "animation_finished")
			queue_free()
		else:
			animplatform.play("idle")
