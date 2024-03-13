extends Area2D

var direction=Vector2.RIGHT
var speed=400

@export var attack_damage := 10.0
@export var knockback_force := 100.0

func _process(delta):
	translate(direction.normalized()*speed*delta)

func _on_proyectile_visibility_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area is HitboxComponente:
		var attack=Attack.new()
		
		attack.attack_damage=attack_damage
		attack.knockback_force=knockback_force
		attack.attack_position=global_position
		area.damage(attack)
