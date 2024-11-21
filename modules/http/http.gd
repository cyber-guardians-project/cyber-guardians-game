extends HTTPRequest

@export var endpoint: String
@export var http_method: HTTPClient.Method
@export var headers = ["Content-Type: application/json"]


func _ready() -> void:
	request_completed.connect(_on_request_completed)
	
func make_request(body: Dictionary):
	print('making request')
	var uri: String = Utils.api_url + endpoint
	var data = JSON.stringify(body)
	
	request(uri, headers, http_method, data)

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	pass
