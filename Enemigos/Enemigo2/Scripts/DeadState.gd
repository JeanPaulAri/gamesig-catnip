extends State

@onready var EnemySprite:Sprite2D=$"../../Sprite2D"
@onready var enemy=$"../.."
@export var Machine:StateMachine
@onready var HitboxEnemy:CollisionShape2D=$"../../HitboxComponente/HitboxCollider"
@onready var Collider=$"../../EnemyJetRatCollider"
@onready var HitAttack=$"../EnemyJetAttack/JetAttack/AttackCollider"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal CurrDir(Direction)

func Enter():
	call_deferred("Disable")

func Disable():
	HitboxEnemy.disabled=true
	Collider.scale.y*=0.1
	HitAttack.disabled=true
	enemy.velocity.x=0

func Update(_delta: float):	
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * _delta

func _on_vida_componente_dead_player():
	print("Dead")
	Transitioned.emit(Machine._curr_state(),"DeadState")
