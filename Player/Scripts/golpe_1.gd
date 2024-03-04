extends Node2D


var attack_damage := 10.0
var knockback_force := 100.0

func _on_hitbox_area_entered(area):
	print("Go area")
	if area is HitboxComponente:
		var attack=Attack.new()
		
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=global_position
		
		area.damage(attack)


