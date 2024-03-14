extends State
class_name boss1_idle

@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Set Random Generator object'''
@onready var random = RandomNumberGenerator.new()

'''Set possibilities for state change (AI)'''
@onready var possibilitie_change = 1 # Possibilitie to change state while idle state
@onready var possibilitie_attack1 = 0.75  # Possibilitie to attack if we decide to change state

'''Replace this with animation name'''
@onready var animationName = 'Idle'


'''Idle enter just plays idle animation'''
func Enter():
	boss.animations[animationName] = true
	animation.play(animationName)
	#print("Player object: ", player.get_position())


func Exit():
	boss.animations[animationName] = false # Just to make sure every state we exit, has its animation var to false


'''Change state to follow or attack (With random possibilities)'''
func changeState():
	if boss.animations[animationName]: return # Idle animation doesn finished yet
	
	if boss.phase == 1: Transitioned.emit('dash')
	elif boss.phase == 2:
		pass
	elif boss.phase == 3:
		pass
	else:
		pass
	#if random.randf() < possibilitie_change:
		#if random.randf() < possibilitie_attack1:  Transitioned.emit('attack1')
		#else: Transitioned.emit('attack2') # Not implemented
	#else: # continue on Idle
		#Enter() # Restart animation (Set animation global to true)
	

func Update(_delta: float):
	pass

'''Dont move (idle stays on the same place)'''
func Physics_Update(_delta: float):
	changeState()
	
