extends CanvasLayer

@export var title_text: String
@export var message_text: String
@export var is_win: bool
@export var level_number: int = 2

@onready var title: Label = $Background/Title
@onready var message: Label = $Background/MessageContainer/Message
@onready var sub_message: Label = $Background/MessageContainer/SubMessage
@onready var coninue_button: Button = $Control/Continue

const START_MENU_SCENE = "res://modules/start_menu/start_menu.tscn"


func _ready() -> void:
	init_parameters()
	
	if not is_win: coninue_button.text = 'Reiniciar'
		

func init_parameters():
	if title_text: title.text = title_text
	if message_text: message.text = message_text


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_menu_pressed() -> void:
	await Utils.transition()
	get_tree().change_scene_to_file(START_MENU_SCENE)


func _on_continue_pressed() -> void:
	if is_win and level_number > Utils.last_level:
		var level_text = 'level_' + str(level_number + 1)
		var next_level_scene = 'res://modules/' + level_text + '/' + level_text + '.tscn'
		
		await Utils.transition()
		get_tree().change_scene_to_file(next_level_scene)
		
		
	if is_win and level_number == Utils.last_level:
		# TODO add game over scene
		get_tree().quit()
		
	if not is_win:
		var level_text = 'level_' + str(level_number)
		var current_level_scene = 'res://modules/' + level_text + '/' + level_text + '.tscn'
		
		await Utils.transition()
		queue_free()
		get_tree().change_scene_to_file(current_level_scene)
