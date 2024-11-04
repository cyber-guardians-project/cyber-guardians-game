extends Node2D

@export var level: int
@export var lives: int = 3
@export var time: int = 150
@export var score: int = 0
@export var score_to_add: int = 100

@onready var player = $Player
@onready var questions = $Questions
@onready var tile_map_layer = $TileMapLayer
@onready var is_question_active = false
@onready var hud = preload("res://modules/hud/hud.tscn") as PackedScene

var hud_instance


func _ready() -> void:
	hud_instance = hud.instantiate()
	
	init_timer()
	init_score()
	init_lives()
	
	init_questions()
	add_child(hud_instance)

		
func _process(delta: float) -> void:			
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
		
func _on_timeout():
	print('timeout')
	
func _on_select_option(option):
	if option['is_correct']:
		score += score_to_add
		hud_instance.update_score(score)
		
		
	if not option['is_correct']:
		lives -= 1
		hud_instance.update_lives(lives)
		
func _on_finish_question(question_point):
	question_point.active = false
	
