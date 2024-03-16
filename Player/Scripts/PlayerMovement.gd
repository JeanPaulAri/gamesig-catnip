extends State
class_name PlayerMovement

@export var PlayerSprite : Sprite2D
@export var AnimationPl :AnimationPlayer
@onready var player:CharacterBody2D=$"../.."
@onready var Dash:=$"../PlayerDash"
@onready var Proyectile=$"../PlayerProyectile"
@onready var Parry=$"../PlayerParry"
@export var PlayerSpeed=10.0

@export var jump_height : float
@export var jump_time_peak : float
@export var jump_time_descent : float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_peak)*-1.0

signal NumDirections(x,y)

func _ready():
	PlayerGlobal.SetGravity(jump_height,jump_time_peak,jump_time_descent)
	PlayerGlobal.MoveSpeed=PlayerSpeed

func jump():
	player.velocity.y = jump_velocity	

func Enter():
	pass
	
func Update(_delta: float):
	#player.velocity.y += PlayerGlobal.get_gravity(player)*_delta
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
	
	if(Input.is_action_just_pressed("ataque")):
		Transitioned.emit(self,"PlayerAttackClaw")
	if Input.is_action_just_pressed("PlayerProyectil") and !Proyectile.is_cooldown():
		Transitioned.emit(self,"PlayerProyectile")
	if (not Input.is_anything_pressed() and player.is_on_floor()):
		Transitioned.emit(self,"PlayerIdle")
	if Input.is_action_just_pressed("Dash") and !Dash.is_cooldown() and (PlayerGlobal.direction_x!=0 or PlayerGlobal.direction_y!=0):
		NumDirections.emit(PlayerGlobal.direction_x,PlayerGlobal.direction_y)
		Transitioned.emit(self,"PlayerDash")
	if Input.is_action_just_pressed("PlayerParry") and !Parry.is_cooldown():
		player.velocity.x = PlayerGlobal.direction_x * (PlayerSpeed/3) 
		Transitioned.emit(self,"PlayerParry")
	if Input.is_action_just_pressed("PlayerSmash"):
		Transitioned.emit(self,"PlayerSmash")
