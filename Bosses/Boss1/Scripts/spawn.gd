extends State
class_name boss1_spawn

@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Replace this with animation name'''
@onready var animationName = 'Idle'

@onready var y_objective = 200
@onready var go_up = 0 
@onready var step = 2


'''Enter just plays idle animation'''
func Enter():
	boss.animations[animationName] = true
	animation.play(animationName)

func Exit():
	boss.animations[animationName] = false # Just to make sure every state we exit, has its animation var to false
	
	
'''After spawn change to idle'''
func changeState():
	if boss.animations[animationName]: return # Animation doesn finished yet
	if go_up <= y_objective: # Boss still spawning
		Enter()
		return 
	Transitioned.emit('idle')
	

func Update(_delta: float):
	pass

'''Floats until reaching the desire altitude'''
func Physics_Update(_delta: float):
	if go_up <= y_objective: 
		boss.global_position.y -= step
		go_up += step
	changeState()
	
