extends Node2D

@export var level: int
@onready var player = $Player
@onready var questions = $Questions
@onready var is_question_active = false
signal open_question

# Called when the node enters the scene tree for the first time.
func _ready() -> void:		
	for question_point in questions.get_children():		
		question_point.level = level
		question_point.number = Utils.get_question_number(question_point.name)
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_question_active:
		var level = get_node('.')
		print(level)
		
	


func _on_open_question() -> void:
	print('open question')
