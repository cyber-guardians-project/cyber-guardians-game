extends Node

var score: int = 0
var unlocked_levels: Array = [1]
var character_variation: int = 0
var current_level: int = 1
var auth_token: String = ''
var user: Dictionary = {}
var games: Array = []

func to_dict() -> Dictionary:
	return {
		"score": score,
		"unlocked_levels": unlocked_levels,
		"character_variation": character_variation,
		"current_level": current_level,
		"auth_token": auth_token,
		"user": user,
		"games": games
	}

func from_dict(data: Dictionary) -> void:
	set_score(data.get("score", score))
	set_unlocked_levels(data.get("unlocked_levels", unlocked_levels))
	set_character_variant(data.get('character_variation', character_variation))
	set_current_level(data.get('current_level', current_level))
	set_auth_token(data.get('auth_token', auth_token))
	set_user(data.get('user', user))
	set_games(data.get("games", games))

func get_score() -> int:
	return score

func get_unlocked_levels() -> Array:
	return unlocked_levels
		
func get_character_variant() -> int:
	return character_variation
	
func get_current_level() -> int:
	return current_level
	
func get_auth_token() -> String:
	return auth_token
	
func get_user() -> Dictionary:
	return user
	
func get_games() -> Array:
	return games


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
	
func set_auth_token(token: String) -> void:
	auth_token = token
	
func set_user(new_user: Dictionary) -> void:
	user = new_user
	
func set_games(new_games: Array) -> void:
	games = new_games
