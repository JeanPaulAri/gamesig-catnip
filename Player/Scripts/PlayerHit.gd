extends State
class_name HitState

@onready var EnemySprite:Sprite2D=$"../../PlayerSprites"
@onready var Timer1:Timer=$StunTime
@onready var Machine:StateMachine=$".."
@onready var HitboxCollider:CollisionShape2D=$"../../HitboxComponente/HitboxPlayer"
@onready var PlayAnim:AnimationPlayer=$"../../AnimationPlayer"

func Enter():
	HitboxCollider.disabled=true
	PlayAnim.play("Player_hit")

func Update(_delta: float):
	EnemySprite.modulate=Color(10,10,10,10)

func _on_vida_componente_hit():
	Timer1.start()
	Transitioned.emit(Machine._curr_state(),"PlayerHit")

func _on_stun_time_timeout():
	HitboxCollider.disabled=false
	EnemySprite.modulate=Color(1,1,1,1)
	Transitioned.emit(self,"PlayerIdle")
