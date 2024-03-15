extends State
class_name PathfindState

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
@export var WalkSprite:Sprite2D
@export var AttackSprite:Sprite2D
@export var AnimationEn:AnimationPlayer
@export var SpriteSize:int
var player: CharacterBody2D

@export var jump_height : float
@export var jump_time_peak : float
@export var jump_time_descent : float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_peak)*-1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_peak * jump_time_peak))*-1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_descent * jump_time_descent))*-1.0

func get_gravity()->float:
	return jump_gravity if enemy.velocity.y < 0.0 else fall_gravity

func Enter():
	WalkSprite.visible=true
	AttackSprite.visible=false
	player=get_tree().get_first_node_in_group("Player")

	
func Physics_Update(delta: float):
	var dir = enemy.to_local(enemy.global_transform.origin).normalized()
	print(dir.x)
	enemy.velocity.y += get_gravity()*delta
	var direction = player.global_position-enemy.global_position
	AnimationEn.play("WalkRight")
	if direction.length()>200:
		enemy.position.x += ((player.position.x+5)-enemy.position.x)/move_speed
		if (player.position.x+5)-enemy.position.x>SpriteSize:
			WalkSprite.flip_h=false
		else:
			WalkSprite.flip_h=true
	if direction.length()<200:
		WalkSprite.visible=false
		AttackSprite.visible=true
		Transitioned.emit(self,"EnemyRatAttack")
	else:
		enemy.velocity=Vector2()
