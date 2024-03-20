extends State
class_name EnemyRatIdle

@export var PlayerAnimation:AnimationPlayer
@onready var enemy:=$"../.."
@onready var EnemySprite:=$"../../EnemySprites"
@onready var timer=$EnemyIdleWalkingTimer
@onready var timer2=$IdleCooldown
@onready var ColliderVision:CollisionShape2D=$EnemyVisionArea/enemyVisionCollider
@export var IdleSpeed=200
var directions:=[-1,1]
var currDirections:int=0
var cooldown:bool=1

signal IsStateOff(State)

func Enter():
	ColliderVision.position.x=325
	currDirections=0
	timer2.start()
	IsStateOff.emit(1)
	#EnemySprite.flip_h=true
	#print("Sprite is ",EnemySprite.flip_h==true)
	if EnemySprite.flip_h==true:
		#EnemySprite.flip_h=false
		ColliderVision.position.x=-325
		currDirections=1

func Update(_delta: float):
	#print("Idle")
	if enemy.get_CurrIdle():
		if !cooldown:
			enemy.velocity.x=directions[currDirections]*IdleSpeed
		else:
			PlayerAnimation.play("Enemy_idle") 
	pass


func _on_enemy_vision_area_body_entered(body):
	if body.is_in_group("Player"):
		enemy.velocity.x=0
		#cooldown=1
		#print("Emit")
		IsStateOff.emit(0)
		timer.stop()
		timer2.stop()
		Transitioned.emit(self,"PathFindComponent")
	pass

func _on_enemy_idle_walking_timer_timeout():
	#print("Timer 1 timeout")
	if enemy.get_CurrIdle():
		currDirections=(currDirections+1)%2
		timer2.start()
		cooldown=true
		enemy.velocity.x=0
	pass
	
func _on_idle_cooldown_timeout():
	#print("Timer 2 timeout")
	if enemy.get_CurrIdle():
		timer.start()
		cooldown=false
		EnemySprite.flip_h=!EnemySprite.flip_h
		ColliderVision.position.x=-ColliderVision.position.x
		PlayerAnimation.play("Enemy_idle") 		
	pass
