extends CheckBox

@export var option = ''

signal select_option(option)

func _ready() -> void:
	connect('toggled', _on_toggled)

func _on_toggled(toggled_on: bool):
	select_option.emit(option)
