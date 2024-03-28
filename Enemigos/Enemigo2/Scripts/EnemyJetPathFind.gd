extends State
class_name EnemyJetPath

@onready var enemy:CharacterBody2D=$"../.."
@export var move_speed := 40.0
@export var AnimationEn:AnimationPlayer
@onready var SpriteSize:int=-15
@onready var EnemySprite:Sprite2D=$"../../Sprite2D"

@export var acceleration:int=2
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal CurrDir(Direction)

func Enter():
	pass
	
func Update(_delta: float):	
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * (_delta + acceleration)
		acceleration+=acceleration
	
	var dir = enemy.to_local(enemy.global_transform.origin).normalized()
	var direction = PlayerGlobal.Global_Position-enemy.global_position
	AnimationEn.play("Enemy_idle")
	enemy.position.x += ((PlayerGlobal.Global_Position.x+5)-enemy.position.x)/move_speed
	if direction.length()>100:
		if (PlayerGlobal.Global_Position.x)-enemy.position.x>-100:
			EnemySprite.flip_h=false
		else:
			EnemySprite.flip_h=true
	if direction.length()<120 and abs(enemy.position.y-PlayerGlobal.Global_Position.y)<100:
		Transitioned.emit(self,"EnemyJetAttack")
