extends Node2D

@export var level: int

@onready var player = $Player
@onready var questions = $Questions
@onready var tile_map_layer = $TileMapLayer
@onready var is_question_active = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:		
	for question_point in questions.get_children():		
		question_point.level = level
		question_point.number = Utils.get_question_number(question_point.name)
		question_point.connect('open_question', _on_open_question)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tile_map_layer.visible = !is_question_active
		
func _on_open_question(is_open: bool):
	is_question_active = is_open
		
