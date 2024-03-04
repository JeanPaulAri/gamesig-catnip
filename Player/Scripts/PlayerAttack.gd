extends State
class_name PlayerAttack

@onready var player=$"../.."
@export var PlayerAnimation:AnimationPlayer
@onready var AttackSprite:=$"../../Attack(temporal)"


var attack_damage := 10.0
var knockback_force := 100.0

func Enter():
	PlayerAnimation.play("AttackRight")
	$AttackClawTimer.start()
	
func Update(_delta: float):
	pass

func _on_attack_claw_hitbox_area_entered(area):
	print("Jugador ataca")
	if area is HitboxComponente:
		var attack=Attack.new()
		
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=player.global_position
		area.damage(attack)

func _on_attack_claw_timer_timeout():
	Transitioned.emit(self,"PlayerIdle")
