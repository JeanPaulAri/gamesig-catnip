extends CharacterBody2D

@export var instanceExample: PackedScene

@export var strength: int = 0
@export var agility: int = 0
@export var aim: int = 0

var Ability_points:int
signal Abilities(Ability_points)
func _physics_process(delta):
	move_and_slide()
	pass

func _input(event: InputEvent) -> void:
	if(event is InputEventMouseButton and get_tree().current_scene.name == "World"):
		if(event.button_index == MOUSE_BUTTON_LEFT):
			if(event.pressed):
				var instance = instanceExample.instantiate()
				add_sibling(instance)
				instance.global_position = get_global_mouse_position()

				
func _ready():
	self.position = Global.spawnPoint
	self.strength = Global.strength
	self.agility= Global.agility
	self.aim= Global.aim
	Ability_points=0


func _get_catNip():
	Ability_points+=1
	print("Got some catNip")
	

'''
const LIMIT_Y = 500

# 0 Left, 1 Right, 2 Up, 3 Down /////// Idle -> 0I

var dashSpeed=1000
var dashCooldown=.99
var normalSpeed=300
var dashLength=.25
var currentDirection = "IdleDown"
var zoom = false
var isAttacking=false
var isAlive=true
var isHit=false
#Mientras mayor sea hitStunValue mayor tiempo de STUN
var hitstunValue=20
var hitstun=hitstunValue
var playerHP=100
var damagePlayer=50
var rng = RandomNumberGenerator.new()

@onready var vida_componente=$VidaComponente
@onready var hitbox_componente=$HitboxComponente/HitboxCollider
@onready var Golpe1=$Golpe1

@onready var dash=$Dash

@onready var WalkSprite = $WalkSprites
@onready var IdleSprite = $IdleSprites
@onready var animationPlayer = $AnimationPlayer
@onready var AttackSprite = $"Attack(temporal)"
@onready var DeadSprite = $Muerto
#@onready var Colision=$CollisionShape2D
@onready var camera = $Camera2D
@onready var CameraAnimated = $AnimationCamera
@onready var audioMuerto = $MichiMuerto
@onready var audioDash = $audioDash

@onready var m1 = $M1
@onready var m2 = $M2
@onready var m3 = $M3
func _ready():
		animationPlayer.play("Right") 
		print("Player Cargado con Exito")
func _physics_process(delta):
	if isHit:
		hitbox_componente.disabled=true
#		Colision.disabled=true
		hitstun-=1
		WalkSprite.modulate=Color(10,10,10,10)
		IdleSprite.modulate=Color(10,10,10,10)
		AttackSprite.modulate=Color(10,10,10,10)
		DeadSprite.modulate=Color(10,10,10,10)
		if hitstun<=0:
			WalkSprite.modulate=Color(1,1,1,1)
			IdleSprite.modulate=Color(1,1,1,1)
			AttackSprite.modulate=Color(1,1,1,1)
			DeadSprite.modulate=Color(1,1,1,1)
			isHit=false
			hitstun=hitstunValue
	if isAlive:
		if Input.is_action_just_pressed("Dash") and !dash.is_cooldown():
			audioDash.playing = true
			dash.start_dash(dashLength)
			dash.cool_down(dashCooldown)
		var SPEED=dashSpeed 
		if dash.is_dashing():
			pass
#			Colision.disabled=true
			hitbox_componente.disabled=true
		else:
			SPEED=normalSpeed
#			Colision.disabled=false
			hitbox_componente.disabled=true
		if(isAttacking!=true):
			movePlayer(SPEED)
		attack()
	else:
		WalkSprite.visible=false
		IdleSprite.visible=false
		AttackSprite.visible=false
		DeadSprite.visible=true

func take_damage(damage):
	print("Player HP: "+str(playerHP))
	audioMuerto.playing = true
	playerHP-=damage
	isHit=true
	AgitarCamera()
	if playerHP<=0:
		isAlive=false
		die()

func die():
	AttackSprite.visible=true
	IdleSprite.visible = false
	WalkSprite.visible = false
	DeadSprite.visible=false
	
	
	if(currentDirection == "IdleRight"):
		animationPlayer.play("DieRight")
	else:
		animationPlayer.play("DieLeft")
	
	

func attack():
	if Input.is_action_pressed("ataque"):
		
		
		var randomNumber = int(rng.randf_range(1,4))
		if(randomNumber == 1):
			m1.playing = true
		elif(randomNumber == 2):
			m2.playing = true
		elif(randomNumber == 3):
			m3.playing = true

		
		AttackSprite.visible=true
		IdleSprite.visible = false
		WalkSprite.visible = false
		DeadSprite.visible=false
		if(currentDirection == "IdleRight"):
			animationPlayer.play("AttackRight")
			AttackSprite.flip_h=false
			isAttacking=true
			await animationPlayer.animation_finished
		elif(currentDirection == "IdleLeft"):
			animationPlayer.play("AttackLeft")
			AttackSprite.flip_h=true
			isAttacking=true
			await animationPlayer.animation_finished
	else:
		AttackSprite.visible=false
		isAttacking=false

func idleToWaleSprite():
	#print("xd")
	WalkSprite.visible = IdleSprite.visible
	IdleSprite.visible = not IdleSprite.visible

func movePlayer(SPEED):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	DeadSprite.visible =false
	if direction_x:
		IdleSprite.visible = false
		WalkSprite.visible =true
		if(direction_x == 1 and isAttacking==false):
			animationPlayer.play("Right") 
			WalkSprite.flip_h=false
			IdleSprite.flip_h=false
			currentDirection="IdleRight"
		elif(direction_x==-1 and isAttacking==false):
			animationPlayer.play("Left") 
			WalkSprite.flip_h=true
			IdleSprite.flip_h=true
			currentDirection="IdleLeft"
		velocity.x = direction_x * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_y:
		WalkSprite.visible =true
		IdleSprite.visible = false
		velocity.y =  direction_y * SPEED 
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	if (not Input.is_anything_pressed() and isAttacking==false):
		IdleSprite.visible = true
		WalkSprite.visible = false
		animationPlayer.play(currentDirection)
	move_and_slide()
	if(position.y <= LIMIT_Y):
		position.y = LIMIT_Y
	if(position.y >= 680):
		position.y = 680
	if(position.x <= camera.limit_left-50):
		position.x = camera.limit_left-50
	if Input.is_action_just_pressed("ui_accept"):
		#CameraAnimatetd.play("zoom")
		ZoomCamera(0.007)# Rango entre [0-0.1]
		#AgitarCamera()
		pass	
	
#func _on_area_derecha_body_entered(body):
#	body.take_damage(damagePlayer)

#func _on_area_izquierda_body_entered(body):
#	body.take_damage(damagePlayer)

func AgitarCamera():
	
	CameraAnimated.play("agitar")
	pass
	
func ZoomCamera(levelZoom):
	
	var position = 1
	var value = levelZoom
		
	for i in range(30):
		await get_tree().create_timer(0.01).timeout
		camera.zoom = Vector2(position+value,position+value)
		position += value
	for i in range(30):
		await get_tree().create_timer(0.01).timeout
		camera.zoom = Vector2(position-value,position-value)
		position -= value


func _on_hitbox_componente_area_entered(area):
	pass # Replace with function body.
'''
