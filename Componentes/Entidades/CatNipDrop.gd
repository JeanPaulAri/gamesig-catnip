extends Marker2D

@onready var coin=preload("res://Componentes/Entidades/cat_nip.tscn")

func _drop_catnip():
	var coin_instance:RigidBody2D=coin.instantiate()
	add_child(coin_instance)

func _on_vida_componente_dead_player():
	call_deferred("_drop_catnip")
