extends State
class_name PlayerProyectile

var bullet_scene = preload("res://Componentes/Entidades/proyectil_component.tscn")
var direction_x=0

func fire():
	print("Hi")
	var bullet=bullet_scene.instantiate()
	if(direction_x == 1):
		bullet.direction=Vector2.RIGHT
	elif(direction_x==-1):
		bullet.direction=Vector2.LEFT
	bullet.global_position=$Bulletposition.global_position
	get_tree().get_root().add_child(bullet)

func Enter():
	fire()
	Transitioned.emit(self,"PlayerMovement")

func Update(_delta: float):
	pass

func _on_player_movement_direction(dir):
	direction_x=dir
