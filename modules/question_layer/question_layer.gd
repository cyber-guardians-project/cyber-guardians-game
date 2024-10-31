extends Control

@export var question = {}

@onready var label = $Label
@onready var question_options_control = $QuestionOptions  # This can be a regular Control node, not necessarily a container

# Adjust this to control the vertical spacing between checkboxes
var checkbox_spacing = 30

func _ready() -> void:
	if question:
		var question_object = question[0]
		label.text = question_object.question
		print(question_object.question)
		
		clear_children()
		
		if question_object.options:
			for i in range(question_object.options.size()):
				create_option_checkbox(question_object.options[i], i)

func create_option_checkbox(option: Dictionary, index: int) -> void:
	var checkbox = CheckBox.new()
	checkbox.text = option["text"]
	checkbox.set_meta("is_correct", option["is_correct"])
	
	# Set position manually based on index and spacing
	checkbox.position = Vector2(0, index * checkbox_spacing)
	
	checkbox.add_theme_font_size_override('font', 8)
	
	# Add the CheckBox as a child of question_options_control
	question_options_control.add_child(checkbox)
	print("Added option:", option["text"])

func clear_children() -> void:
	for child in question_options_control.get_children():
		question_options_control.remove_child(child)
		child.queue_free()
