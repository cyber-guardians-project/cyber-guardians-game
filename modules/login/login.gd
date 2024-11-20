extends Control

@onready var email: LineEdit = $Email
@onready var password: LineEdit = $Password
@onready var login_button: Button = $LoginButton

var isPasswordSetted
var isEmailSetted	

func _process(delta: float) -> void:
	isPasswordSetted =  len(password.text) > 0
	isEmailSetted =  len(email.text) > 0
	
	login_button.disabled = not(isEmailSetted and isPasswordSetted)
