extends State
class_name boss1_attack1

@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Set Random Generator object'''
@onready var random = RandomNumberGenerator.new()

'''Set possibilities for state change (AI)'''
@onready var possibilitie_idle = 1  # Possibilitie to idle after attack animation

'''Replace this with animation name'''
@onready var animationName = 'Attack Right'


'''Enter just plays idle animation'''
func Enter():
	boss.animations[animationName] = true
	animation.play(animationName)
	#print("Player object: ", player.player.get_position())


func Exit():
	boss.animations[animationName] = false # Just to make sure every state we exit, has its animation var to false


'''Change state to follow or long distance attack 'beam' (With random possibilities)'''
func changeState():
	if boss.animations[animationName]: return # Attack animation doesn finished yet
	
	if random.randf() < possibilitie_idle: 
		Transitioned.emit('idle')
	else: 
		Transitioned.emit('follow')
	

func Update(_delta: float):
	pass

'''Dont move (Close distance attack)'''
func Physics_Update(_delta: float):
	changeState()
	
