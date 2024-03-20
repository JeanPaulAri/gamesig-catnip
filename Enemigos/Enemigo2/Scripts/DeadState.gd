extends State

@onready var EnemySprite:Sprite2D=$"../../Sprite2D"
@onready var enemy=$"../.."
@export var Machine:StateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal CurrDir(Direction)

func Enter():
	pass
	
func Update(_delta: float):	
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * _delta

func _on_vida_componente_dead_player():
	print("Dead")
	#Transitioned.emit(Machine._curr_state(),"DeadState")
	#Enter()
