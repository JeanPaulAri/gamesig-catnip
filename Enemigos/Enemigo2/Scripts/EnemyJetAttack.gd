extends State
class_name EnemyJetAttack

@onready var Entity=$"../.."
@export var PlayerAnimation:AnimationPlayer
@onready var EnemySprite:=$"../../Sprite2D"
@onready var AttackCollider:=$JetAttack/AttackCollider

var attack_damage := 10.0
var knockback_force := 100.0

func Enter():
	AttackCollider.position.x=66
	if EnemySprite.flip_h==true:
		print("ChangeSide")
		AttackCollider.position.x=-66
	PlayerAnimation.play("Enemy_attack")
	$JetAttackTimer.start()
	
func Update(_delta: float):
	pass


func _on_jet_attack_timer_timeout():
	Transitioned.emit(self,"EnemyJetPathFind")


func _on_jet_attack_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=Entity.global_position
		area.damage(attack)
