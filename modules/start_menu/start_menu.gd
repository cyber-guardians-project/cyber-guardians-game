extends Control

@onready var step1: Control = $Step1
@onready var step2: Control = $Step2

var isStep1: bool = true

const SELECT_CHARACTER_SCENE = "res://modules/select_character/select_character.tscn"
const LOGIN_SCENE = "res://modules/login/login.tscn"
const REGISTER_SCENE = "res://modules/register/register.tscn"

func _process(delta: float) -> void:
	step1.visible = isStep1
	step2.visible = not isStep1

func _on_new_pressed():
	StateManager.update_score(0)
	StateManager.save_game()
	
	await Utils.transition()
	get_tree().change_scene_to_file(SELECT_CHARACTER_SCENE)


func _on_continue_pressed():
	pass # Replace with function body.

func _on_learn_pressed() -> void:
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()


func _on_login_pressed() -> void:
	await Utils.transition()
	get_tree().change_scene_to_file(LOGIN_SCENE)
	
	
func _on_guest_pressed() -> void:
	isStep1 = false


func _on_register_pressed() -> void:
	await Utils.transition()
	get_tree().change_scene_to_file(REGISTER_SCENE)
