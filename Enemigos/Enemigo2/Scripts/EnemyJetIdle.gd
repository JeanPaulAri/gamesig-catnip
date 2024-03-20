extends State
class_name EnemyJetIdle

@onready var AnimPlayer:AnimationPlayer=$"../../AnimationPlayer"

func Enter():
	AnimPlayer.play("Enemy_idle")

func Update(_delta: float):
	pass

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		Transitioned.emit(self,"EnemyJetLaunch")
