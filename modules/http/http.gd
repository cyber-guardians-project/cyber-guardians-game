extends Node

@onready var http_request: HTTPRequest = $HTTPRequest

@export var endpoint: String
@export var http_method: HTTPClient.Method
@export var body: JSON
@export var headers = ["Content-Type: application/json"]


func _ready() -> void:
	var uri: String = Utils.api_url + endpoint
	var data = JSON.stringify(body)
	
	http_request.request_completed.connect(_on_request_completed)
	http_request.request(uri, headers, http_method, data)
	

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	print(body, 'response body')
