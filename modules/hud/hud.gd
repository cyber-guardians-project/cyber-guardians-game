extends Node

@onready var timer = $TimerContainer/Timer
@onready var label = $TimerContainer/Label

@export var total_time = 300

signal timer_timeout	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = total_time
	label.text = str(total_time)
	
	start_timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var time_left = int(timer.time_left)
	label.text = str(time_left)
	
	if time_left == 0:
		label.text = '¡Se acabó el tiempo!'
	
func start_timer():
	timer.connect('timeout', _on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	emit_signal('timer_timeout')
