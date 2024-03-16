extends State
class_name PlayerSmash

@export var SmashCooldown=.99
@export var SmashingSpeed=100

@onready var timer2= $CoolDownTimer
@export var AnimationPlay:AnimationPlayer
@export var player_collider:CollisionShape2D
@export var hitbox:CollisionShape2D
@onready var player:CharacterBody2D=$"../.."
@onready var collider:=$AreaSmash/AreaSmashCollider

var attack_damage := 10.0
var knockback_force := 100.0
var direction=1

signal IsSmashingSig(IsSmashing,SmashingSpeed)

func cool_down(dur):
	timer2.wait_time=dur
	timer2.start()
	
func is_cooldown():
	return !timer2.is_stopped()

func Enter():
	IsSmashingSig.emit(1,SmashingSpeed)
	collider.disabled=false
	AnimationPlay.play("Player_smash")
	#hitbox.disabled=true
	#player_collider.disabled=true
	cool_down(SmashCooldown)
	
func Update(_delta: float):
	if player.is_on_floor():
		collider.disabled=true
		IsSmashingSig.emit(0,SmashingSpeed)
		Transitioned.emit(self,"PlayerIdle")

func _on_area_smash_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=player.global_position
		area.damage(attack)
