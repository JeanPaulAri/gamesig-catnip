extends Node2D

var attack=Attack.new()

func _ready():
	attack.attack_damage=15.0
	attack.knockback_force=150.0
	attack.attack_position=global_position
	print("Attack Ready")

func _on_hitbox_area_entered(area):
	print("GolpeBoss1AreaEntered")
	if area is HitboxComponente:
		area.damage(attack)
