extends Node

var player_name: String = ''
var score: int = 0
var unlocked_levels: Array = []
var character_variation: int = 0

func to_dict() -> Dictionary:
	return {
		"player_name": player_name,
		"score": score,
		"unlocked_levels": unlocked_levels,
		"character_variation": character_variation
	}

func from_dict(data: Dictionary) -> void:
	set_player_name(data.get("player_name", player_name))
	set_high_score(data.get("score", score))
	set_unlocked_levels(data.get("unlocked_levels", unlocked_levels))
	set_character_variant(data.get('character_variation', character_variation))

func get_player_name() -> String:
	return player_name

func get_score() -> int:
	return score

func get_unlocked_levels() -> Array:
	return unlocked_levels
		
func get_character_variant() -> int:
	return character_variation


func set_player_name(value: String) -> void:
	player_name = value

func set_high_score(value: int) -> void:
	if value >= 0:  
		score = value

func set_unlocked_levels(value: Array) -> void:
	if typeof(value) == TYPE_ARRAY:
		unlocked_levels = value
		
func set_character_variant(variation: int) -> void:
	character_variation = variation
