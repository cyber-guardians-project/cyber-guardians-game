extends Node

var questions_data_path = 'res://data/questions.json'
var player_variations_path = 'res://data/player_varations.json'
var game_state_path = 'res://data/game_state.json'


func get_question_number(question_name: String) -> int:
	var question_name_parts: Array = question_name.split('_')
	var question_number = int(question_name_parts[1])
	
	return question_number
	
	
func read_file(file_path: String):
	if FileAccess.file_exists(file_path):
		var content = FileAccess.open(file_path, FileAccess.READ)
		var data = JSON.parse_string(content.get_as_text())
		
		return data
	else:
		print("File doesn't  exists")
	
		
func get_question(level: int, question_number: int) -> Array:
	var questions = read_file(questions_data_path)

	return questions.filter(func(question): return question.level == level and question.number == question_number)
	
	
func get_player_variations() -> Array:
	var player_variations = read_file(player_variations_path)
	
	return player_variations
	
		
func convertHexToVector(hexColor: String) -> Vector3:
	if hexColor.begins_with('#'):
		hexColor = hexColor.substr(1)
	
	var r = hexColor.substr(0,2).hex_to_int() / 255.0
	var g = hexColor.substr(2,2).hex_to_int() / 255.0
	var b = hexColor.substr(4,2).hex_to_int() / 255.0

	return Vector3(r,g,b)
