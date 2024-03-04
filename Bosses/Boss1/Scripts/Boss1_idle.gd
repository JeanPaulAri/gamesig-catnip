extends State
class_name boss1_idle

@onready var player = $"."
@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Set Random Generator object'''
@onready var random = RandomNumberGenerator.new()

'''Set possibilities for state change (AI)'''
@onready var possibilitie_change = 0.20 # Possibilitie to change state while idle state
@onready var possibilitie_attack = 1.0  # Possibilitie to attack if we decide to change state


'''Idle enter just plays idle animation'''
func Enter():
	boss.animations['Idle'] = true
	animation.play('Idle')
	#print("Player object: ", player.get_position())


func Exit():
	boss.animations['Idle'] = false # Just to make sure every state we exit, has its animation var to false


'''Change state to follow or attack (With random possibilities)'''
func changeState():
	if boss.animations['Idle']: return # Idle animation doesn finished yet
	
	if random.randf() < possibilitie_change:
		if random.randf() < possibilitie_attack: 
			Transitioned.emit('attack1')
		else: 
			Transitioned.emit('follow') # Not implemented
	else: # continue on Idle
		Enter() # Restart animation (Set animation global to true)
	

func Update(_delta: float):
	pass

'''Dont move (idle stays on the same place)'''
func Physics_Update(_delta: float):
	changeState()
	
