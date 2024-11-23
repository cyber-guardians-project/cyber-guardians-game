extends Button

@export var game: Dictionary = {}

const NEW_GAME_MESSAGE = 'Nueva Partida'
const CONTINUE_GAME_MESSAGE = 'Continuar'
const DEFAULT_MESSAGE = '[Vacío]'
const SELECT_CHARACTER_SCENE = "res://modules/select_character/select_character.tscn"


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	pressed.connect(_on_pressed)


func _process(delta: float) -> void:
	if not isEmptyGame():
		text = 'Nivel ' + str(game.current_level)
		
	if isEmptyGame():
		text = DEFAULT_MESSAGE
		
	
func set_game(value: Dictionary) -> void:
	game = value
	
func _on_mouse_entered() -> void:
	pass
		
	
func _on_mouse_exited() -> void:
	pass
	
func _on_pressed() -> void:
	if isEmptyGame():
		await Utils.transition()
		get_tree().change_scene_to_file(SELECT_CHARACTER_SCENE)
	
	print(game)
	
func isEmptyGame():
	return len(game) == 0
