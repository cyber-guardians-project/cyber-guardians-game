extends Area2D

@onready var player_variation: int

signal player_variation_select(variation: int)

func _ready() -> void:
	player_variation = get_parent().variation
#
#
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		player_variation_select.emit(player_variation)
