extends Node2D

@onready var level = 1
@onready var player = $Player
@onready var questions = $Questions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for question_point in questions.get_children():		
		question_point.level = level
		question_point.number = Utils.get_question_number(question_point.name)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
