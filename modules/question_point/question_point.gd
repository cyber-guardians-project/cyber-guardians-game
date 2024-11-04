extends Area2D

signal question_entered(question_id)	

@export var level: int
@export var number: int
@export var active: bool = true

var question_layer = preload("res://modules/question_layer/question_layer.tscn")
var question_layer_instance

signal open_question(is_open: bool)
signal select_option(option)
signal finish_question

func _on_body_entered(body: Node2D) -> void:
	if active:
		var question_instance = question_layer.instantiate()
		var question = Utils.get_question(level, number)
		question_layer_instance = question_instance
		
		open_question.emit(true)
		question_instance.question = question
		question_instance.connect('select_option', _on_select_option)
		
		get_tree().root.add_child(question_instance)
	
func _on_select_option(option):
	if option['is_correct']:
		question_layer_instance.queue_free()
		open_question.emit(false)
		finish_question.emit(self)
		
	select_option.emit(option)
