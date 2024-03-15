extends State
class_name PlayerIdle

@export var PlayerAnimation:AnimationPlayer
@export var PlayerSprite:Sprite2D

func Enter():
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
	if Input.is_action_just_pressed("PlayerProyectil"):
		Transitioned.emit(self,"PlayerProyectile")
	if Input.is_action_just_pressed("PlayerParry"):
		Transitioned.emit(self,"PlayerParry")
