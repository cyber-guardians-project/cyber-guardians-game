extends ColorRect

@onready var characters_container = $CharactersContainer as HBoxContainer

var character_variaton_selected: int
var characters: Array

func _ready() -> void:
	get_characters()
	init_characters()


func _on_player_variation_select(variation: int):
	character_variaton_selected = variation
	update_characters_animations()
	
func init_characters():
	for character in characters:
		character.animation = 'idle'
		var character_area = character.get_node("SelectCharacterArea") as Area2D
		character_area.connect('player_variation_select', _on_player_variation_select)
		
		
func get_characters():
	characters = characters_container.get_children()
	
		
func get_character():
	var character = characters.filter(func(character): return character.variation == character_variaton_selected)
	
	return character[0]
	
func update_characters_animations():
	for character in characters:
		character.animation = 'idle'
		
	get_character().animation = 'walk'
	
	
