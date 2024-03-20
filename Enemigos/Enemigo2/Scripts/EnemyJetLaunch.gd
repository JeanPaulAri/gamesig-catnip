extends State

@onready var EnemyJet=$"../.."
@onready var EnemySprite = $"../../Sprite2D"
@onready var PlayAnim = $"../../AnimationPlayer"

'''Missile Speed'''
@export var speed = 100

var attack_damage := 10.0
var knockback_force := 100.0

func Enter():
	EnemyJet.velocity = Vector2(speed, 0.0) # Set any direction (will be updated)
	PlayAnim.play("Enemy_launch")
	EnemyJet.rotation=90

func Update(_delta: float):
	#print(EnemyJet.velocity)
	#print(PlayerGlobal.isParrying)
	'''Redirect Projectile towards player'''
	EnemyJet.velocity = EnemyJet.global_position.direction_to(PlayerGlobal.Global_Position) * speed
	
	'''Rotate Sprite towards player'''
	EnemySprite.set_rotation(EnemyJet.velocity.angle())

func _on_launch_area_area_entered(area):
	if area is HitboxComponente:
		if PlayerGlobal.isParrying==true:
			print("Pathfind")
			EnemyJet.rotation=0
			EnemySprite.flip_v=true
			#EnemySprite.flip_h=true
			Transitioned.emit(self,"EnemyJetPathFind")
		else:
			var attack=Attack.new()
			attack.attack_damage=attack_damage
			attack.knockback_force=knockback_force
			attack.attack_position=EnemyJet.global_position
			area.damage(attack)
			Transitioned.emit(self,"DeadState")
