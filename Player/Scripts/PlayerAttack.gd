extends State
class_name PlayerAttack

@onready var player=$"../.."
@export var PlayerAnimation:AnimationPlayer
@export var Player_sprite:Sprite2D
@onready var collider:=$AttackClawHitbox/AttackClawCollider


var attack_damage := 10.0
var knockback_force := 100.0

func Enter():
	if(PlayerGlobal.last_direction_x == 1):
		Player_sprite.flip_h=false
		collider.position.x=10.3
	elif(PlayerGlobal.last_direction_x==-1):
		Player_sprite.flip_h=true
		collider.position.x=-12.3
	PlayerAnimation.play("Player_attack")
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
