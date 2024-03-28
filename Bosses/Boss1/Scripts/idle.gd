extends State
class_name boss1_idle

@onready var boss = $"../.."
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'idle'


'''Idle enter just plays idle animation'''
func Enter():
	bossAnimation.play(animationName)
	#print("Player object: ", player.get_position())


func Exit():
	pass


'''Change state to follow or attack (With random possibilities)'''
func changeState():
	
	if boss.phase == 1: Transitioned.emit('dash')
	elif boss.phase == 2: Transitioned.emit('dash')
	elif boss.phase == 3: Transitioned.emit('jump')
	else: Transitioned.emit('jump')
	
	
'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	changeState()

func Update(_delta: float):
	pass

'''Dont move (idle stays on the same place)'''
func Physics_Update(_delta: float):
	#changeState()
	pass
	
