extends KinematicBody2D

signal dead

func _ready():
	$BatSound.play()

func _on_Area2D_body_entered(body) -> void:
	emit_signal("dead")
	get_tree().change_scene("res://Scene/GameOver1.tscn")
