extends State
class_name PlayerParry

@export var parryCooldown=.99
@export var parryLength=.25


@onready var timer= $ParryTimer
@onready var timer2= $CoolDownTimer
@export var AnimationPlay:AnimationPlayer
@export var player_collider:CollisionShape2D
@export var hitbox:CollisionShape2D
@onready var player:CharacterBody2D=$"../.."
var direction=1

signal IsParryingSig(IsParrying)

func start_parry(dur):
	timer.wait_time=dur
	timer.start()

func cool_down(dur):
	timer2.wait_time=dur
	timer2.start()

func is_parrying():
	return !timer.is_stopped()
	
func is_cooldown():
	return !timer2.is_stopped()

func Enter():
	IsParryingSig.emit(1)
	AnimationPlay.play("Player_parry")
	#hitbox.disabled=true
	#player_collider.disabled=true
	start_parry(parryLength)
	cool_down(parryCooldown)
	
func Update(_delta: float):
	pass

func _on_parry_timer_timeout():
	IsParryingSig.emit(0)
	#player_collider.disabled=false
	#hitbox.disabled=false
	Transitioned.emit(self,"PlayerIdle")
	pass 
