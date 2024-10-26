extends Node


func get_question_number(question_name: String) -> int:
	var question_name_parts: Array = question_name.split('_')
	var question_number = int(question_name_parts[1])
	
	return question_number
