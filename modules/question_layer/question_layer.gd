extends Control


@export var question = {}

@onready var label = $Label 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if question:
		var question_object = question[0]
		label.text = question_object.question
		print(question_object.question)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
