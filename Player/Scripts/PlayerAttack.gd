extends State
class_name PlayerAttack

@onready var player:CharacterBody2D=$"../.."
@export var PlayerAnimation:AnimationPlayer
@export var Player_sprite:Sprite2D
@onready var collider:=$AttackClawHitbox/AttackClawCollider


@export var attack_damage := 10.0
@export var knockback_force := 100.0

var direction_x

func Enter():
	direction_x=PlayerGlobal.last_direction_x
	if(direction_x == 1):
		Player_sprite.flip_h=false
		collider.position.x=10.3
	elif(direction_x==-1):
		Player_sprite.flip_h=true
		collider.position.x=-12.3
	PlayerAnimation.play("Player_attack")
	$AttackClawTimer.start()
	
func Update(_delta: float):
	if(direction_x == PlayerGlobal.direction_x):
		player.velocity.x = PlayerGlobal.direction_x * PlayerGlobal.MoveSpeed 
	elif(direction_x!=PlayerGlobal.direction_x):
		player.velocity.x = PlayerGlobal.direction_x * (PlayerGlobal.MoveSpeed/4)  
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, PlayerGlobal.MoveSpeed)

func _on_attack_claw_hitbox_area_entered(area):
	#print("Jugador ataca")
	if area is HitboxComponente:
		var attack=Attack.new()
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=player.global_position
		area.damage(attack)

func _on_attack_claw_timer_timeout():
	collider.disabled=true
	PlayerAnimation.stop()
	Transitioned.emit(self,"PlayerIdle")
