extends Node

var jump_velocity: float 
var jump_gravity : float 
var fall_gravity : float 

var direction_x:int
var last_direction_x:int
var direction_y:int
var last_direction_y:int

var MoveSpeed:int

var IsDashing:bool
var isParrying:bool

var Global_Position:Vector2

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
	var jump_height=jh
	var jump_time_peak=jtp
	var jump_time_descent=jtd
	
	jump_velocity = ((2.0 * jump_height) / jump_time_peak)*-1.0
	jump_gravity = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
	fall_gravity = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0

func get_gravity(velocity_y):
	return jump_gravity if velocity_y < 0.0 else fall_gravity
