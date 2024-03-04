extends State
class_name PlayerIdle

@export var PlayerAnimation:AnimationPlayer
@onready var WalkSprite:=$"../../WalkSprites"
@onready var IdleSprite:=$"../../IdleSprites"
@onready var AttackSprite:=$"../../Attack(temporal)"
@onready var DeadSprite:=$"../../Muerto"
var direction_x=1

func Enter():
	if(direction_x == 1):
		IdleSprite.flip_h=false
	elif(direction_x==-1):
		IdleSprite.flip_h=true
	PlayerAnimation.play("IdleLeft") 
	WalkSprite.visible=false
	IdleSprite.visible=true
	AttackSprite.visible=false
	DeadSprite.visible=false

func Update(_delta: float):
	if(Input.get_vector("ui_left","ui_right","ui_up","ui_down")):
		WalkSprite.visible=true
		IdleSprite.visible=false
		AttackSprite.visible=false
		DeadSprite.visible=false
		Transitioned.emit(self,"PlayerMovement")
	if(Input.is_action_just_pressed("ataque")):
		WalkSprite.visible=false
		IdleSprite.visible=false
		AttackSprite.visible=true
		DeadSprite.visible=false
		Transitioned.emit(self,"PlayerAttackClaw")


func _on_player_movement_direction(dir):
	direction_x=dir
