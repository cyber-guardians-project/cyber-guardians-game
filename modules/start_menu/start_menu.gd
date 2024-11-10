extends Control

const SELECT_CHARACTER_SCENE = "res://modules/select_character/select_character.tscn"


func _on_new_pressed():
	get_tree().change_scene_to_file(SELECT_CHARACTER_SCENE)


func _on_continue_pressed():
	pass # Replace with function body.

func _on_learn_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
