extends State
class_name RatDash

@export var PlayerAnimation:AnimationPlayer
@onready var enemy:=$"../.."
@onready var EnemySprite:=$"../../EnemySprites"
@onready var timer=$DashDuration
@onready var timer2=$DashCooldown
@onready var AttackCollider:CollisionShape2D=$"../EnemyRatAttack/EnemyRatAttackHitbox/EnemyRatAttackCollider"
@export var DashSpeed=600

var currDirections:int=0
var cooldown:bool=1

# Called when the node enters the scene tree for the first time.
func Enter():
	AttackCollider.position.x=91
	currDirections=1
	AttackCollider.disabled=false
	if EnemySprite.flip_h==true:
		AttackCollider.position.x=-91
		currDirections=-1
		
	timer.start()
	timer2.start()

func Update(_delta: float):
	enemy.velocity.x=currDirections*DashSpeed

func is_dashing():
	return !timer.is_stopped()
	
func is_cooldown():
	return !timer2.is_stopped()

func _on_dash_duration_timeout():
	AttackCollider.disabled=true
	Transitioned.emit(self,"EnemyRatIdle")

