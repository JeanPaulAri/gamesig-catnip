extends Node2D

const WIDTH = 1280
const HEIGHT = 720

#@onready pl = $Player
@onready var player = $TileMap/Player
@onready var b1 = $Background/B1
@onready var b2 = $Background/B2 
@onready var b3 = $Background/B3
@onready var cameraPlayer = $TileMap/Player/Camera2D
@onready var collisionShape = $TileMap/Area2D/CollisionShape2D
@onready var menuPausa = $MenuPaused
var currentBackground = 2
var EstaDentro = false
func _ready():
	print("Mundo cargado con exito")
	#print(player)
	#print( get_tree().current_scene.get_node("Player").name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	simularBackground()
	pass

func simularBackground():
	pass
	'''
	if(b1.position.x-WIDTH/2 < player.position.x and player.position.x < b1.position.x+WIDTH/2):
		currentBackground = 1
	elif(b2.position.x-WIDTH/2 < player.position.x  and player.position.x  < b2.position.x+WIDTH/2):
		currentBackground = 2
	elif(b3.position.x-WIDTH/2 < player.position.x  and player.position.x < b3.position.x+WIDTH/2):
		currentBackground =3
		
	if(currentBackground == 3):
		b1.position.x = b3.position.x+WIDTH
	elif(currentBackground == 2):
		b3.position.x = b2.position.x+WIDTH
	elif(currentBackground == 1):
		b2.position.x = b1.position.x+WIDTH
	if(EstaDentro):

		# 8.1 esta masso bien segun testing, consultar si se usa	
		#if player.dash.is_dashing():
		#	collisionShape.position.x += 8.1*12
		#	cameraPlayer.limit_left = cameraPlayer.limit_left + 8.1*12
		#	menuPausa.position.x += 8.1*12
		#else:
		collisionShape.position.x += 8.1
		cameraPlayer.limit_left = cameraPlayer.limit_left + 8.1
	'''	


