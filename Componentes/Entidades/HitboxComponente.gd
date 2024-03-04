extends Area2D
class_name HitboxComponente

@export var vida_componente : VidaComponente

func damage(attack:Attack):
	print("auchis")
	if vida_componente:
		vida_componente.damage(attack)

