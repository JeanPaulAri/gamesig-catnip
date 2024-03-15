extends Node
var direction_x
var last_direction_x

func _ready():
	direction_x=0
	last_direction_x=0

func _process(delta):
	direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x!=0:
		last_direction_x=direction_x
