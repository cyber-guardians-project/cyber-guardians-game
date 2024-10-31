extends Node


func get_question_number(question_name: String) -> int:
	var question_name_parts: Array = question_name.split('_')
	var question_number = int(question_name_parts[1])
	
	return question_number
	
		
func get_question(level: int, question_number: int) -> Array:
	var questions = [
	{
		"level": 1,
		"number": 1,
		"category": "Gestión de usuario",
		"question": "¿Qué es la autenticación de dos factores (2FA)?",
		"options": [
			{"text": "Un método para crear contraseñas más largas", "is_correct": false},
			{"text": "Un método que requiere dos formas de verificación", "is_correct": true},
			{"text": "Un tipo de gestor de contraseñas", "is_correct": false},
			{"text": "Un sistema para recordar contraseñas", "is_correct": false}
		]
	},
	{
		"level": 1,
		"number": 2,
		"category": "Phishing",
		"question": "¿Qué es el smishing?",
		"options": [
			{"text": "Phishing a través de llamadas telefónicas", "is_correct": false},
			{"text": "Phishing a través de mensajes SMS", "is_correct": true},
			{"text": "Phishing a través de correos electrónicos", "is_correct": false},
			{"text": "Phishing en redes sociales", "is_correct": false}
		]
	},
	{
		"level": 1,
		"number": 3,
		"category": "La prevención de malware",
		"question": "¿Qué es un ransomware?",
		"options": [
			{"text": "Un antivirus gratuito", "is_correct": false},
			{"text": "Un tipo de malware que bloquea el acceso a los archivos hasta que se pague un rescate", "is_correct": true},
			{"text": "Un programa que mejora la velocidad del sistema", "is_correct": false},
			{"text": "Un software para crear contraseñas seguras", "is_correct": false}
		]
	},
	{
		"level": 1,
		"number": 4,
		"category": "Encriptación",
		"question": "¿Qué es la encriptación?",
		"options": [
			{"text": "Un método para acelerar la transferencia de datos", "is_correct": false},
			{"text": "Un proceso que convierte datos legibles en un formato codificado", "is_correct": true},
			{"text": "Un tipo de software antivirus", "is_correct": false},
			{"text": "Un protocolo de red", "is_correct": false}
		]
	},
	{
		"level": 1,
		"number": 5,
		"category": "Privacidad de los datos",
		"question": "¿Qué es un 'breach' o violación de datos?",
		"options": [
			{"text": "La recopilación legal de datos", "is_correct": false},
			{"text": "Un acceso no autorizado a información personal sensible", "is_correct": true},
			{"text": "Un método para mejorar la seguridad cibernética", "is_correct": false},
			{"text": "Una técnica para compartir información", "is_correct": false}
		]
	},
	{
		"level": 2,
		"number": 1,
		"category": "Inyección de código SQL",
		"question": "¿Cuál es el principal objetivo de un ataque de inyección SQL?",
		"options": [
			{"text": "Mejorar el rendimiento del servidor", "is_correct": false},
			{"text": "Acceder o modificar datos sensibles en una base de datos", "is_correct": true},
			{"text": "Aumentar la velocidad de carga del sitio web", "is_correct": false},
			{"text": "Cambiar la apariencia del sitio web", "is_correct": false}
		]
	},
	{
		"level": 2,
		"number": 2,
		"category": "Ataques de fuerza bruta",
		"question": "¿Cuál es una característica común en las contraseñas que son vulnerables a ataques de fuerza bruta?",
		"options": [
			{"text": "Contraseñas largas y complejas", "is_correct": false},
			{"text": "Contraseñas cortas y fáciles de adivinar", "is_correct": true},
			{"text": "Contraseñas únicas para cada cuenta", "is_correct": false},
			{"text": "Contraseñas generadas aleatoriamente", "is_correct": false}
		]
	},
	{
		"level": 2,
		"number": 3,
		"category": "Robo de identidad",
		"question": "¿Qué tipo de información puede ser robada en un ataque de robo de identidad?",
		"options": [
			{"text": "Solo números de tarjetas de crédito", "is_correct": false},
			{"text": "Nombre, número de seguro social, y datos bancarios", "is_correct": true},
			{"text": "Solo información médica", "is_correct": false},
			{"text": "Información sobre redes sociales", "is_correct": false}
		]
	},
	{
		"level": 2,
		"number": 4,
		"category": "Malvertising",
		"question": "¿Qué tipo de malware se puede distribuir a través del malvertising?",
		"options": [
			{"text": "Solo virus", "is_correct": false},
			{"text": "Ransomware, spyware y adware, entre otros", "is_correct": true},
			{"text": "Solo adware", "is_correct": false},
			{"text": "Ninguno, ya que el malvertising es seguro", "is_correct": false}
		]
	},
	{
		"level": 2,
		"number": 5,
		"category": "Exfiltración de datos",
		"question": "¿Qué papel puede jugar un insider en la exfiltración de datos?",
		"options": [
			{"text": "Ninguno, ya que solo los atacantes externos lo hacen", "is_correct": false},
			{"text": "Puede facilitar el acceso a información sensible", "is_correct": true},
			{"text": "Solo puede reportar incidentes", "is_correct": false},
			{"text": "No tiene acceso a datos sensibles", "is_correct": false}
		]
	}
	]
	return questions.filter(func(question): return question.level == level and question.number == question_number)
	
	
