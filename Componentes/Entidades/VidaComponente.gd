extends Node2D
class_name VidaComponente

@export var MAX_VIDA := 10.0
@onready var HitStun:=$HitStun
var vida: float
signal DeadPlayer()
signal Hit()

func _ready():
	vida=MAX_VIDA
	
func damage(attack: Attack):
	Hit.emit()
	vida -= attack.attack_damage
	if vida <=0:
		print("Muerto")
		emit_signal("DeadPlayer")

