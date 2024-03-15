extends State
class_name PlayerMovement

@export var PlayerSprite : Sprite2D
@export var AnimationPl :AnimationPlayer
@onready var player := $"../.."
@onready var Dash:=$"../PlayerDash"
@export var PlayerSpeed=10.0

@export var jump_height : float
@export var jump_time_peak : float
@export var jump_time_descent : float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_peak)*-1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0

func set_global(jump_h, jump_tp, jump_td):
	jump_h=jump_height
	jump_tp=jump_time_peak
	jump_td=jump_time_descent

func get_gravity()->float:
	return jump_gravity if player.velocity.y < 0.0 else fall_gravity

func jump():
	player.velocity.y = jump_velocity	

func Enter():
	pass
	
func Update(_delta: float):
	player.velocity.y += get_gravity()*_delta
	if Input.is_action_pressed("ui_up") and player.is_on_floor():
		AnimationPl.play("Player_jump")
		jump()
	elif player.is_on_floor():
		AnimationPl.play("Player_walk")
	if PlayerGlobal.direction_x:
		if(PlayerGlobal.direction_x == 1):
			PlayerSprite.flip_h=false
		elif(PlayerGlobal.direction_x==-1):
			PlayerSprite.flip_h=true
		player.velocity.x = PlayerGlobal.direction_x * PlayerSpeed 
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, PlayerSpeed)
	player.move_and_slide()
	
	if(Input.is_action_just_pressed("ataque")):
		Transitioned.emit(self,"PlayerAttackClaw")
	if Input.is_action_just_pressed("PlayerProyectil"):
		Transitioned.emit(self,"PlayerProyectile")
	if (not Input.is_anything_pressed() and player.is_on_floor()):
		Transitioned.emit(self,"PlayerIdle")
	if Input.is_action_just_pressed("Dash") and !Dash.is_cooldown() and player.velocity.x!=0:
		Transitioned.emit(self,"PlayerDash")
