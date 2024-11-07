extends Control

func _on_new_pressed():
	get_tree().change_scene_to_file("res://modules/level_1/level_1.tscn")


func _on_continue_pressed():
	pass # Replace with function body.

func _on_learn_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
