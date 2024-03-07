extends State
class_name DeadState

@export var WalkSprite:=Sprite2D
@export var IdleSprite:=Sprite2D
@export var AttackSprite:=Sprite2D
@export var DeadSprite:=Sprite2D
@export var Machine:StateMachine

func Enter():
	WalkSprite.visible=false
	IdleSprite.visible=false
	AttackSprite.visible=false
	DeadSprite.visible=true

func Update(_delta: float):
	pass

func _on_vida_componente_dead_player():
	print("Dead")
	Transitioned.emit(Machine._curr_state(),"DeadState")
	Enter()
