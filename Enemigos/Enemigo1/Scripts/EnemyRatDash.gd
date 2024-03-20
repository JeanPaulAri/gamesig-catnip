extends State
class_name RatDash

@export var PlayerAnimation:AnimationPlayer
@onready var enemy:=$"../.."
@onready var EnemySprite:=$"../../EnemySprites"
@onready var EnemyDashSprite:Sprite2D=$"../../DashSprite"
@onready var timer=$DashDuration
@onready var timer2=$DashCooldown
@onready var AttackCollider:CollisionShape2D=$"../EnemyRatAttack/EnemyRatAttackHitbox/EnemyRatAttackCollider"
@export var DashSpeed=600

var currDirections:int=0
var cooldown:bool=1

# Called when the node enters the scene tree for the first time.
func Enter():
	EnemySprite.visible=false
	EnemyDashSprite.visible=true
	AttackCollider.position.x=91
	currDirections=1
	EnemyDashSprite.flip_h=false
	AttackCollider.disabled=false
	if EnemySprite.flip_h==true:
		EnemyDashSprite.flip_h=true
		EnemyDashSprite.position.x-=8
		AttackCollider.position.x=-91
		currDirections=-1
		
	PlayerAnimation.play("Enemy_dash")
	timer.start()
	timer2.start()

func Update(_delta: float):
	enemy.velocity.x=currDirections*DashSpeed

func is_dashing():
	return !timer.is_stopped()
	
func is_cooldown():
	return !timer2.is_stopped()

func _on_dash_duration_timeout():
	if EnemySprite.flip_h==true:
		EnemyDashSprite.position.x+=8
	
	EnemySprite.visible=true
	EnemyDashSprite.visible=false
	AttackCollider.disabled=true
	Transitioned.emit(self,"EnemyRatIdle")

