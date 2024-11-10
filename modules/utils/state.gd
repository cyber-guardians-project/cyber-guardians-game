extends Node

var player_name: String = ''
var score: int = 0
var unlocked_levels: Array = [1]
var character_variation: int = 0
var current_level: int = 1

func to_dict() -> Dictionary:
	return {
		"player_name": player_name,
		"score": score,
		"unlocked_levels": unlocked_levels,
		"character_variation": character_variation,
		"current_level": current_level
	}

func from_dict(data: Dictionary) -> void:
	set_player_name(data.get("player_name", player_name))
	set_score(data.get("score", score))
	set_unlocked_levels(data.get("unlocked_levels", unlocked_levels))
	set_character_variant(data.get('character_variation', character_variation))
	set_current_level(data.get('current_level', current_level))

func get_player_name() -> String:
	return player_name

func get_score() -> int:
	return score

func get_unlocked_levels() -> Array:
	return unlocked_levels
		
func get_character_variant() -> int:
	return character_variation
	
func get_current_level() -> int:
	return current_level


func set_player_name(value: String) -> void:
	player_name = value

func set_score(value: int) -> void:
	if value >= 0:  
		score = value

func set_unlocked_levels(value: Array) -> void:
	if typeof(value) == TYPE_ARRAY:
		unlocked_levels = value
		
func set_character_variant(variation: int) -> void:
	character_variation = variation
	
func set_current_level(level: int) -> void:
	current_level = level
