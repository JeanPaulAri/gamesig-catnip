extends CharacterBody2D

#@onready var player = find_node('Player')
@onready var sprite = $BossSprites
@onready var TM = $TuringMachineAI
@onready var healtBar = $CanvasLayer/ProgressBar
@onready var phase = 1 # starting phase
@onready var n_phases:int = 4
@onready var life_phases = []
@onready var max_X:int
@onready var min_X:int
@onready var boss_width:int = 200
@onready var player

@export var vidaComponent:VidaComponente

'''Deprecated Vars'''
var direction : Vector2
var dmg = 50
var HP = 50*16

'''Animation global vars to know if an animation has finished'''
#var animationsNames = {'idle': false, 'dash': false, 'projectile': false}

'''We need to obtain this in other way'''
var plataforms = [Vector2(211,176), Vector2(814,162), Vector2(200,515), Vector2(810,521), Vector2(516,358)]


func _ready():
	player = find_player(get_tree().get_root())
	
	'''Get the limits of the level (In order to know when boss dash should finish)'''
	max_X = global_position.x
	min_X = global_position.x - get_viewport().content_scale_size.x + boss_width
	print("X: ", min_X," ",  max_X)
	
	
	'''Calc Life phases. life_phases is being use to update the boss phase'''
	for i in range(0, n_phases+1):
		life_phases.append(float(vidaComponent.MAX_VIDA * i/n_phases))
	
	print("Life phases: ", life_phases)
	
	
	'''Flip Sprites (boos spawns at right and should see to the left)'''	
	$BossSprites.flip_h = true


func find_player(node):
	# Check if the current node is the player node
	if node.has_method("get_name") and node.get_name() == "Player": return node

	# Traverse children recursively
	for i in range(node.get_child_count()):
		var result = find_player(node.get_child(i))
		if result: return result

func update_life_and_phase():
	'''Update HealtBar'''
	healtBar.value = vidaComponent.vida
	
	'''Update Phase'''
	for i in range(n_phases-1):
		if life_phases[i] < vidaComponent.vida and vidaComponent.vida <= life_phases[i+1]:
			if phase != n_phases - i: print("Boss Fight Phase: ", n_phases - i)
			phase = n_phases - i
	
	#print("Boss Fight Phase: ", phase)
	#print("Vida: ", vidaComponent.vida, " // Phase: ", phase)
	

func _process(_delta):
	#print("Player position: ", player.global_position)
	#direction = player.position - position
	#sprite.flip_h = direction.x<0 # Flip sprites towards player
	pass
	
func _physics_process(delta):
	pass

'''Function called when an animation finishes (Set var to false and turing machine may change state)'''
func _on_boss_animations_animation_finished(anim_name):
	#if anim_name not in animationsNames.keys():
		#print("Not in keys: ", anim_name )
		##return
	#animationsNames[anim_name] = false
	TM.currentAnimationFinished(anim_name)



func _on_hitbox_componente_area_entered(area):
	update_life_and_phase()
	
