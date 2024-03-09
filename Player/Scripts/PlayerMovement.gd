extends State
class_name PlayerMovement

@onready var WalkSprite := $"../../WalkSprites"
@onready var AnimationPl := $"../../AnimationPlayer"
@onready var IdleSprite:=$"../../IdleSprites"
@onready var AttackSprite:=$"../../Attack(temporal)"
@onready var player := $"../.."
@onready var Dash:=$"../PlayerDash"
@export var PlayerSpeed=10.0

@export var jump_height : float
@export var jump_time_peak : float
@export var jump_time_descent : float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_peak)*-1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0
var last_direction=0
signal direction(dir)

func movePlayer(SPEED):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	if direction_x:
		if(direction_x == 1):
			AnimationPl.play("Right") 
			WalkSprite.flip_h=false
		elif(direction_x==-1):
			AnimationPl.play("Left") 
			WalkSprite.flip_h=true
		player.velocity.x = direction_x * SPEED 
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
	
	if (not Input.is_anything_pressed() and player.is_on_floor()):
		emit_signal("direction",last_direction)
		Transitioned.emit(self,"PlayerIdle")
	
	if Input.is_action_just_pressed("Dash") and !Dash.is_cooldown():
		emit_signal("direction",direction_x)
		Transitioned.emit(self,"PlayerDash")
	
	last_direction=direction_x

func get_gravity()->float:
	return jump_gravity if player.velocity.y < 0.0 else fall_gravity

func jump():
	player.velocity.y = jump_velocity	

func Enter():
	pass
	
func Update(_delta: float):
	player.velocity.y += get_gravity()*_delta
	if Input.is_action_pressed("ui_up") and player.is_on_floor():
		jump()
	movePlayer(PlayerSpeed)
	player.move_and_slide()
