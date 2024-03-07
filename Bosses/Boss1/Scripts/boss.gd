extends CharacterBody2D

#@onready var player = find_node('Player')
@onready var sprite = $Sprite2D
var player

var direction : Vector2
var dmg = 50
var HP = 50*16

'''Animation global vars to know if an animation has finished'''
var animations = {'Idle': false, 'Attack Right': false, 'Beam': false}


func _ready():
	set_physics_process(false) # Physisc are processed on TM AI states
	player = find_player(get_tree().get_root())

func find_player(node):
	# Check if the current node is the player node
	if node.has_method("get_name") and node.get_name() == "Player": return node

	# Traverse children recursively
	for i in range(node.get_child_count()):
		var result = find_player(node.get_child(i))
		if result: return result

	

func _process(_delta):
	#print("Player position: ", player.global_position)
	#direction = player.position - position
	#sprite.flip_h = direction.x<0 # Flip sprites towards player
	pass
	

'''Function called when an animation finishes (Set var to false and turing machine may change state)'''
func _on_animation_player_animation_finished(anim_name):
	#print("\nAnimation: ", anim_name, " has finished\n")
	if anim_name not in animations.keys():
		print("Not in keys")
		return
	animations[anim_name] = false




'''Marcelo's Code '''
'''
extends CharacterBody2D

@onready var pj = get_parent().find_child("Player")
@onready var sprite = $Sprite2D

var direction : Vector2

var dmg = 50
var HP = 50*16

func _ready():
	set_physics_process(true) # false

func  _process(_delta):
	direction = pj.position - position
	if direction.x<0:
		sprite.flip_h =true
	else:
		sprite.flip_h =false
		
func _physics_process(delta):
	velocity = direction.normalized()*50 # 200 (velo)
	move_and_collide(velocity * delta)
	
func dmgPlayer():
	pj.take_damage(dmg)
'''



