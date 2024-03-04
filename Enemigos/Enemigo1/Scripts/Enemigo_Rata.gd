extends CharacterBody2D
class_name RatEnemy

func _physics_process(_delta):
	pass
	
	
'''
var speed:int = 100
var player_chase:bool = false
var player=null
var enemy_attack:bool = false
var enemy_Direction="Null"
var damageEnemy=50
var HealthPoints=201
var isAlive:bool=true
var isHit:bool=false
var A_Cooldown=true
var hitstun=10
var hitMultiplier=20

@onready var moveSprites = $Movement
@onready var animationPlayer = $AnimationPlayer
@onready var attackSprites = $Attack
@onready var DeadSprite = $Muerto

var hitColor=true

var spriteSize=120
func _physics_process(delta):
	if isHit:
		if player.currentDirection=="IdleLeft":
			position.x -= hitMultiplier
		else:
			position.x += hitMultiplier
		hitstun-=1
		moveSprites.modulate=Color(10,10,10,10)
		attackSprites.modulate=Color(10,10,10,10)
		if hitstun<=0:
			moveSprites.modulate=Color(1,1,1,1)
			attackSprites.modulate=Color(1,1,1,1)
			isHit=false
			hitstun=10
	if isAlive:
		DeadSprite.visible=false
		if player_chase and not enemy_attack and A_Cooldown:
			moveSprites.visible=true
			attackSprites.visible=false
			position += ((player.position+Vector2(5,5))-position)/speed
			if (player.position.x+5)-position.x>spriteSize:
				animationPlayer.play("WalkRight")
			elif (player.position.x-5)-position.x>0 and (player.position.x+5)-position.x<spriteSize and abs(position.y-player.position.y)<120:
				enemy_attack=true
				enemy_Direction="Right"
				
			elif (player.position.x+5)-position.x<0 and (player.position.x+5)-position.x>-spriteSize and abs(position.y-player.position.y)<120:
				enemy_attack=true
				enemy_Direction="Left"
			else:
				animationPlayer.play("WalkLeft")
		elif enemy_attack and A_Cooldown==true:
			moveSprites.visible=false
			attackSprites.visible=true
			DeadSprite.visible=false
			animationPlayer.play("Attack" + enemy_Direction)
			await animationPlayer.animation_finished
			enemy_attack=false
			A_Cooldown=false
			$AttackCooldown.start()
		else:
			attackSprites.visible=false
			moveSprites.visible=true
			animationPlayer.play("Idle"+enemy_Direction)
	else:
		moveSprites.visible=false
		attackSprites.visible=false
		DeadSprite.visible=true

func _on_attack_cooldown_timeout():
	A_Cooldown=true

func damage(attack:Attack):
	HealthPoints-=attack.attack_damage
	print("HP enemigo: "+str(HealthPoints))
	isHit=true
	velocity = (global_position - attack.attack_position).normalized()*attack.knockback_force
	if HealthPoints<=0:
		isAlive=false
		die()

func die():
	attackSprites.visible=true
	moveSprites.visible = false
	animationPlayer.play("Die"+enemy_Direction)
	get_tree().change_scene_to_file("res://Scenes/WorldJusto.tscn")

func _on_attack_left_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(damageEnemy)
	else:
		pass

func _on_deteccion_body_entered(body):
	if body.is_in_group("Player"):
		if body.isAlive==true:
			player=body
			player_chase=true
		else:
			player_chase=false

func _on_attack_right_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(damageEnemy)
	else:
		pass
'''
