extends State
class_name PlayerDash

var dashSpeed=1000
var dashCooldown=.99
var dashLength=.25


@onready var timer= $ParryTimer
@onready var timer2= $CoolDownTimer
@export var AnimationPlay:AnimationPlayer
@export var player_collider:CollisionShape2D
@export var hitbox:CollisionShape2D
@export var player:CharacterBody2D
var direction=1

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
	AnimationPlay.play("Player_parry")
	#hitbox.disabled=true
	#player_collider.disabled=true
	start_parry(dashLength)
	cool_down(dashCooldown)
	
func Update(_delta: float):
	pass

func _on_parry_timer_timeout():
	player_collider.disabled=false
	hitbox.disabled=false
	Transitioned.emit(self,"PlayerIdle")
	pass 
