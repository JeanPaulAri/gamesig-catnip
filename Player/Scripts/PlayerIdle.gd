extends State
class_name PlayerIdle

@onready var Player=$"../.."
@onready var Proyectile=$"../PlayerProyectile"
@onready var Parry=$"../PlayerParry"
@export var PlayerAnimation:AnimationPlayer
@export var PlayerSprite:Sprite2D

func Enter():
	Player.velocity.x=0
	if(PlayerGlobal.last_direction_x == 1):
		PlayerSprite.flip_h=false
	elif(PlayerGlobal.last_direction_x==-1):
		PlayerSprite.flip_h=true
	PlayerAnimation.play("Player_idle") 

func Update(_delta: float):	
	if(Input.get_vector("ui_left","ui_right","ui_up","ui_down")):
		Transitioned.emit(self,"PlayerMovement")
	if(Input.is_action_just_pressed("ataque")):
		Transitioned.emit(self,"PlayerAttackClaw")
	if Input.is_action_just_pressed("PlayerProyectil") and !Proyectile.is_cooldown():
		Transitioned.emit(self,"PlayerProyectile") 
	if Input.is_action_just_pressed("PlayerParry") and !Parry.is_cooldown():
		Transitioned.emit(self,"PlayerParry")
	if Input.is_action_just_pressed("PlayerSmash") :
		Transitioned.emit(self,"PlayerSmash")
