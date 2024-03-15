extends Node
var jump_height : float
var jump_time_peak : float
var jump_time_descent : float

var jump_velocity: float 
var jump_gravity : float 
var fall_gravity : float 

var direction_x
var last_direction_x


func _ready():
	direction_x=0
	last_direction_x=0
	
	#var JumpState=preload("res://Player/Scripts/PlayerMovement.gd")
	#var jumpStateIns=JumpState.instantiate()
	#jumpStateIns.set_global(jump_velocity,jump_gravity,fall_gravity)
	
	#jump_velocity = ((2.0 * jump_height) / jump_time_peak)*-1.0
	#jump_gravity = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
	#fall_gravity = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0

func _process(delta):
	direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x!=0:
		last_direction_x=direction_x
