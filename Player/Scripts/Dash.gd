extends State
class_name PlayerDash

var dashSpeed=1000
var dashCooldown=.99
var dashLength=.25


@onready var timer= $Dashtimer
@onready var timer2= $Cooldown
@export var AnimationPlay:AnimationPlayer
@export var player_collider:CollisionShape2D
@export var hitbox:CollisionShape2D
@export var player:CharacterBody2D
var dashing:bool=0
var direction_x=1
var direction_y=1
var HitTile:bool=0

signal IsDashingSig(IsDashing)

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
	dashing=true
	PlayerGlobal.IsDashing=true
	IsDashingSig.emit(dashing)
	#direction_x=PlayerGlobal.last_direction_x
	AnimationPlay.play("Player_dash")
	hitbox.disabled=true
	player_collider.disabled=true
	start_dash(dashLength)
	cool_down(dashCooldown)
	
func Update(_delta: float):
	if !HitTile:
		player.velocity.x = direction_x * dashSpeed
		player.velocity.y=direction_y*dashSpeed
	else:
		player.velocity.x=0

func _on_dashtimer_timeout():
	dashing=false
	PlayerGlobal.IsDashing=false
	IsDashingSig.emit(dashing)
	player_collider.disabled=false
	hitbox.disabled=false
	Transitioned.emit(self,"PlayerIdle")
	HitTile=0 

func _on_dash_check_tile_body_entered(body):
	if body.name == "TileMap" and dashing:
		HitTile=1
	pass


func _on_player_movement_num_directions(x, y):
	direction_x=x
	direction_y=y
