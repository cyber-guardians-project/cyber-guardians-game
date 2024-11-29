extends Control

const START_SCREEN = "res://modules/start_menu/start_menu.tscn"

func _on_back_pressed() -> void:
	await Utils.transition()
	get_tree().change_scene_to_file(START_SCREEN)
