extends Control

func _ready():
	$Die_Sound.play()

func _on_PlayAgain_pressed():
	get_tree().change_scene("res://Scene/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
