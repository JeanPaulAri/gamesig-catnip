extends State
class_name EnemyRatAttack

@onready var Entity=$"../.."
@export var PlayerAnimation:AnimationPlayer
@onready var AttackSprite:=$"../../Attack"


var attack_damage := 10.0
var knockback_force := 100.0

func Enter():
	PlayerAnimation.play("AttackLeft")
	$EnemyRatAttackTimer.start()
	
func Update(_delta: float):
	pass

func _on_enemy_rat_attack_hitbox_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=Entity.global_position
		area.damage(attack)


func _on_enemy_rat_attack_timer_timeout():
	Transitioned.emit(self,"PathFindComponent")
