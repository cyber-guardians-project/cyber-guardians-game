extends Control

const START_SCREEN = "res://modules/start_menu/start_menu.tscn"

@onready var games = StateManager.get_games()


func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(START_SCREEN)


func _on_game_1_toggled(toggled_on: bool) -> void:
	print('hola')


func _on_game_1_button_up() -> void:
	print('hola')
