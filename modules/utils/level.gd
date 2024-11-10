extends Node2D

@export var level: int
@export var lives: int = 3
@export var time: int = 60
@export var score: int = 0
@export var score_to_add: int = 100

@onready var player = $Player
@onready var questions = $Questions
@onready var tile_map_layer = $TileMapLayer
@onready var is_question_active = false
@onready var hud = preload("res://modules/hud/hud.tscn") as PackedScene

const RESULTS_SCREEN_SCENE = "res://modules/results_screen/results_screen.tscn"

var results_sceen = preload("res://modules/results_screen/results_screen.tscn")

var hud_instance
var character_variation

@onready var retry_dialog = preload("res://modules/dialog/dialog.tscn") as PackedScene


func _ready():
	get_character()

	hud_instance = hud.instantiate()
	
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
		lives -= 1
		hud_instance.update_lives(lives)
		
		if lives <= 0:
			#show_dialog('Intenta Nuevamente')
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
	
	# Iterate through all children and free those that are not in the globals list
	for child in root_children:
		if child not in globals_to_keep:
			child.queue_free()
	
	var results_screen_instance = results_sceen.instantiate()
	results_screen_instance.title_text = title
	results_screen_instance.level_number = level
	results_screen_instance.is_win = is_win
	results_screen_instance.message_text = message
	
	get_tree().root.add_child(results_screen_instance)
	
	queue_free()
	
	
func _on_show_score():
	show_results_screen('Resultados Nivel ' + str(level), true, '!Felicidades ' + StateManager.get_player_name() + '!')
	
	
	
