extends Control

func _ready() -> void:
	$AudioStreamPlayer.play()

func _on_Button_pressed() -> void:
	get_tree().change_scene("res://Scene/Level1.tscn")
