extends State
class_name EnemyRatIdle

@export var PlayerAnimation:AnimationPlayer
@export var enemy: CharacterBody2D
@onready var WalkSprite:=$"../../Movement"
@onready var AttackSprite:=$"../../Attack"
@onready var DeadSprite:=$"../../Muerto"
var player: CharacterBody2D

func Enter():
	player=get_tree().get_first_node_in_group("Player")
	PlayerAnimation.play("IdleLeft") 
	WalkSprite.visible=true
	AttackSprite.visible=false
	DeadSprite.visible=false

func Update(_delta: float):
	var direction = player.global_position-enemy.global_position
	if(direction.length()<1000):
		DeadSprite.visible=false
		Transitioned.emit(self,"PathFindComponent")
