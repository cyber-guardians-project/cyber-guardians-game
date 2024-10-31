extends Area2D

signal question_entered(question_id)	

@export var level: int
@export var number: int

var question_layer = preload("res://modules/question_layer/question_layer.tscn")

signal open_question(is_open: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	var question_instance = question_layer.instantiate()
	var question = Utils.get_question(level, number)
	
	open_question.emit(true)
		 
	question_instance.question = question
	
	add_child(question_instance)
	print(question_instance)
