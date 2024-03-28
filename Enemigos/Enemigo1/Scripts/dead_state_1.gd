extends State
class_name DeadState_1

@onready var EnemySprite:Sprite2D=$"../../EnemySprites"
@export var Machine:StateMachine
@onready var HitEnemy=$"../../HitboxComponente/CollisionShape2D"
@onready var enemy=$"../.."
@onready var ColliderEnemy=$"../../CollisionShape2D"
@onready var HitAttack=$"../EnemyRatAttack/EnemyRatAttackHitbox/EnemyRatAttackCollider"
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	call_deferred("Disable")

func Disable():
	HitEnemy.disabled=true
	#ColliderEnemy.disabled=true
	ColliderEnemy.scale.y*=0.1
	HitAttack.disabled=true
	enemy.velocity.x=0

func Update(_delta: float):
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * _delta

func _on_vida_componente_dead_player():
	print("Dead")
	Transitioned.emit(Machine._curr_state(),"DeadState")
