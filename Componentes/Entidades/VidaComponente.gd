extends Node2D
class_name VidaComponente

@export var MAX_VIDA := 10.0
@onready var HitStun:=$HitStun
var vida: float

func _ready():
	vida=MAX_VIDA
	
func damage(attack: Attack):
	vida -= attack.attack_damage
	if vida <=0:
		print("Muerto")

