extends CanvasLayer

@export var title_text: String
@export var message_text: String
@export var is_win: bool
@export var level_number: int

@onready var title = $Background/Title
@onready var message = $Background/MessageContainer/Message
@onready var sub_message = $Background/MessageContainer/SubMessage


func _ready() -> void:
	if title_text: title.text = title_text
	if message_text: message.text = message_text
	
	if is_win:
		sub_message.text = get_win_options()
	
	if not is_win:
		sub_message.text = get_lose_options()

	
func get_win_options():
	return '(e) para siguiente nivel
			(r) para volver a la pantalla de inicio
			(1) para salir del juego'
			
			
func get_lose_options():
	return '(e) para reiniciar nivel
			(r) para volver a la pantalla de inicio
			(1) para salir del juego'
		
