extends State
class_name PathfindState

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
@export var WalkSprite:Sprite2D
@export var AttackSprite:Sprite2D
@export var AnimationEn:AnimationPlayer
@export var SpriteSize:int
var player: CharacterBody2D

func Enter():
	WalkSprite.visible=true
	AttackSprite.visible=false
	player=get_tree().get_first_node_in_group("Player")

	
func Physics_Update(delta: float):
	var direction = player.global_position-enemy.global_position
	AnimationEn.play("WalkRight")
	if direction.length()>200:
		enemy.position += ((player.position+Vector2(5,5))-enemy.position)/move_speed
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
