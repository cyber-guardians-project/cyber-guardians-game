extends Node2D

@export var level: int
@export var lives: int = 3
@export var time: int = 100
@export var score: int = 0
@export var score_to_add: int = 100

@onready var player = $Player
@onready var questions = $Questions
@onready var tile_map_layer = $TileMapLayer
@onready var is_question_active = false
@onready var hud = preload("res://modules/hud/hud.tscn") as PackedScene
@onready var http = preload("res://modules/http/http.tscn") as PackedScene
@onready var http_instance = http.instantiate()

const RESULTS_SCREEN_SCENE = "res://modules/results_screen/results_screen.tscn"

var results_sceen = preload("res://modules/results_screen/results_screen.tscn")

var hud_instance
var character_variation

@onready var retry_dialog = preload("res://modules/dialog/dialog.tscn") as PackedScene


func _ready():	
	get_character()
	hud_instance = hud.instantiate()
	
	http_instance.request_completed.connect(_on_request_completed)
	add_child(http_instance)
	
	if not is_current_game():
		create_game()
	
	
	init_timer()
	init_score()
	init_lives()
	
	init_questions()
	add_child(hud_instance)
	

func _process(delta: float):			
	tile_map_layer.visible = !is_question_active
	player.visible = !is_question_active
	player.active = !is_question_active
	
		
func _on_open_question(is_open: bool):
	is_question_active = is_open
	
func init_timer():
	hud_instance.total_time = time
	hud_instance.connect('timer_timeout', _on_timeout)
	
func init_score():
	var saved_score = StateManager.get_score()
	
	if saved_score:
		score = saved_score
	
	hud_instance.score = score
	
func init_lives():
	hud_instance.lives = lives
	
	
func init_questions():
	for question_point in questions.get_children():		
		question_point.level = level
		question_point.number = Utils.get_question_number(question_point.name)
		question_point.connect('open_question', _on_open_question)
		question_point.connect('select_option', _on_select_option)
		question_point.connect('finish_question', _on_finish_question)
		question_point.connect('show_score', _on_show_score)

		
func _on_timeout():
	show_dialog('¡Se acabó el tiempo!')
	await get_tree().create_timer(2.0).timeout
	show_results_screen('¡Se Agotó El Tiempo!', false, '¡Intentalo De Nuevo!')
	

func _on_select_option(option):
	if option['is_correct']:
		score += score_to_add
		hud_instance.update_score(score)
		
		
	if not option['is_correct']:
		if lives > 0:
			lives -= 1
			hud_instance.update_lives(lives)

		
		if lives <= 0:
			lives = 0
			hud_instance.update_lives(lives)

			await get_tree().create_timer(2.0).timeout
			show_results_screen('¡Has Perdido!', false, '¡Intentalo De Nuevo!')
						
		
func _on_finish_question(question_point):
	question_point.active = false
	
func show_dialog(message: String) -> void:
	var dialog_instance = retry_dialog.instantiate()
	
	dialog_instance.text = message
	add_child(dialog_instance)
	
	
func get_character():
	character_variation = StateManager.get_character_variation()
	player.variation = character_variation
	
func show_results_screen(title: String, is_win: bool, message: String):
	await Utils.transition()
	
	var root_children = get_tree().root.get_children()
	
	var globals_to_keep = [Utils, State, StateManager, TransitionScreen]
	
	for child in root_children:
		if child not in globals_to_keep:
			child.queue_free()
	
	var results_screen_instance = results_sceen.instantiate()
	results_screen_instance.title_text = title
	results_screen_instance.level_number = level
	results_screen_instance.is_win = is_win
	results_screen_instance.message_text = message
	results_screen_instance.score = score
	results_screen_instance.lives = lives
	results_screen_instance.elapsed_time = hud_instance.get_elapsed_time()
	
	get_tree().root.add_child(results_screen_instance)
	
	queue_free()
	
	
func _on_show_score():
	var unlocked_levels = StateManager.get_unlocked_levels()
	var next_level = level + 1
	unlocked_levels.append(next_level)
	
	StateManager.update_score(score)
	StateManager.update_unlocked_levels(unlocked_levels)
	StateManager.save_game()
	
	show_results_screen('Resultados Nivel ' + str(level), true, '!Felicidades ' + StateManager.user.user_name + '!')
	
	
func save_level():
	pass
	
func create_game():
	var game_data = {
		"score": 0,
		"character_variation": character_variation,
		"current_level": 1,
		"levels": {
			"level": 1,
			"score": 0,
			"elapsed_time": 0
		}
	}
	
	make_http_request(HTTPClient.Method.METHOD_POST, '/games', game_data)
	
	
	
func make_http_request(method: HTTPClient.Method, endpoint: String, body: Dictionary) -> void:
	var headers = ['Authorization: Bearer ' + StateManager.get_auth_token()]
	http_instance.http_method = method
	http_instance.endpoint = endpoint
	
	http_instance.make_request(body, headers)
	
	
func is_current_game():
	return len(StateManager.get_game()) > 0
	
func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var response_string = body.get_string_from_utf8()
	var response_json = JSON.parse_string(response_string)
	
	if response_code != HTTPClient.RESPONSE_OK and response_code != HTTPClient.RESPONSE_CREATED:
		Utils.show_dialog('Ocurrió un error al guardar la partida')
	
	print(response_json)
	
