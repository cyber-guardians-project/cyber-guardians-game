extends Node

var questions_data_path = 'res://data/questions.json'


func get_question_number(question_name: String) -> int:
	var question_name_parts: Array = question_name.split('_')
	var question_number = int(question_name_parts[1])
	
	return question_number
	
		
func get_question(level: int, question_number: int) -> Array:
	var questions = get_questions()

	return questions.filter(func(question): return question.level == level and question.number == question_number)
	
	
func get_questions():
	if FileAccess.file_exists(questions_data_path):
		var content = FileAccess.open(questions_data_path, FileAccess.READ)
		var question_data = JSON.parse_string(content.get_as_text())
		
		return question_data
	else:
		print("File doesn't  exists")
	
	
	
