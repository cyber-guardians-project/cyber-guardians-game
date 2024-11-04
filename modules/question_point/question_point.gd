extends Area2D

signal question_entered(question_id)	

@export var level: int
@export var number: int

var question_layer = preload("res://modules/question_layer/question_layer.tscn")

signal open_question(is_open: bool)
signal select_option(option)

func _on_body_entered(body: Node2D) -> void:
	var question_instance = question_layer.instantiate()
	var question = Utils.get_question(level, number)
	
	open_question.emit(true)
	question_instance.question = question
	question_instance.connect('select_option', _on_select_option)
	
	get_tree().root.add_child(question_instance)
	
func _on_select_option(option):
	select_option.emit(option)
