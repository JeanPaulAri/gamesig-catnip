extends Area2D




func _on_body_entered(body):
	if body.name == "Player":
		Global.updateSpawn(self.global_position)
		Global.updateStats(body.strength,body.agility,body.aim)
