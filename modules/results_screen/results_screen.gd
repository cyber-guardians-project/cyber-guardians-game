extends CanvasLayer

@export var title_text: String

@onready var title = $Background/Title

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = title_text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
