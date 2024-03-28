extends State
class_name boss1_spawn

@onready var boss = $"../.."
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'idle'

@onready var y_objective = 200
@onready var go_up = 0 
@onready var step = 2


'''Enter just plays idle animation'''
func Enter():
	animation_finished(animationName)

func Exit():
	pass
	
	
'''After spawn change to idle'''
func changeState():
	Transitioned.emit('idle')
	

'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	if (anim_name != animationName): print("WEIRD: ", anim_name, " - ", animationName )
	bossAnimation.play(animationName)


func Update(_delta: float):
	pass


'''Floats until reaching the desire altitude'''
func Physics_Update(_delta: float):
	if go_up <= y_objective: # Move Up
		boss.global_position.y -= step
		go_up += step
		
	if go_up > y_objective: changeState() #When boss is on position
	
