extends Node2D

@export var level: int

@onready var player = $Player
@onready var questions = $Questions
@onready var tile_map_layer = $TileMapLayer
@onready var is_question_active = false
@onready var timer = preload("res://modules/timer/timer.tscn") as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_timer()
	init_questions()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tile_map_layer.visible = !is_question_active
	player.visible = !is_question_active
		
func _on_open_question(is_open: bool):
	is_question_active = is_open
	
func init_timer():
	var timer_instance = timer.instantiate()
	add_child(timer_instance)
	
func init_questions():
	for question_point in questions.get_children():		
		question_point.level = level
		question_point.number = Utils.get_question_number(question_point.name)
		question_point.connect('open_question', _on_open_question)
		
