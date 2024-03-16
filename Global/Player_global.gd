extends Node
var jump_height : float
var jump_time_peak : float
var jump_time_descent : float

var jump_velocity: float 
var jump_gravity : float 
var fall_gravity : float 

var direction_x
var last_direction_x

var direction_y
var last_direction_y

var MoveSpeed

var IsDashing

func _ready():
	direction_x=0
	last_direction_x=0

func _process(delta):
	direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x!=0:
		last_direction_x=direction_x
		
	direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_y!=0:
		last_direction_y=direction_y

func SetGravity(jh,jtp,jtd):
	jump_height=jh
	jump_time_peak=jtp
	jump_time_descent=jtd
	
	jump_velocity = ((2.0 * jump_height) / jump_time_peak)*-1.0
	jump_gravity = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
	fall_gravity = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0

func get_gravity(velocity_y):
	return jump_gravity if velocity_y < 0.0 else fall_gravity
