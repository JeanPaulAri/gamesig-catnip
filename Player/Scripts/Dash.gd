extends State
class_name PlayerDash

var dashSpeed=1000
var dashCooldown=.99
var dashLength=.25


@onready var timer= $Dashtimer
@onready var timer2= $Cooldown
@export var player_collider:CollisionShape2D
@export var hitbox:CollisionShape2D
@export var Movement:Node2D
@export var player:CharacterBody2D
var direction=-1

func start_dash(dur):
	timer.wait_time=dur
	timer.start()

func cool_down(dur):
	timer2.wait_time=dur
	timer2.start()

func is_dashing():
	return !timer.is_stopped()
	
func is_cooldown():
	return !timer2.is_stopped()

func Enter():
	hitbox.disabled=true
	player_collider.disabled=true
	start_dash(dashLength)
	cool_down(dashCooldown)
	
func Update(_delta: float):
	player.velocity.x = direction * dashSpeed 

func _on_player_movement_direction(dir):
	direction=dir

func _on_dashtimer_timeout():
	player_collider.disabled=false
	hitbox.disabled=false
	Transitioned.emit(self,"PlayerIdle")
	pass 
