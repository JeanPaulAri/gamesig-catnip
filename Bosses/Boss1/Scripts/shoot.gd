extends State
class_name boss1_hoot


@onready var boss = $"../.."
@onready var sprites = $"../../BossSprites"
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'projectile'


'''Plays animation'''
func Enter():
	bossAnimation.play(animationName)
	

func Exit():
	pass
	
	
'''Change to another state depends of the boss phase'''
func changeState():
	if boss.phase == 1: Transitioned.emit('dash')
	elif boss.phase == 2: Transitioned.emit('idle')
	else: Transitioned.emit('dash')
	

'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	changeState()


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
		 
