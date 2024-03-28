extends State
class_name boss1_stunned


@onready var boss = $"../.."
@onready var sprites = $"../../BossSprites"
@onready var timer = $Timer
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'idle'
@onready var stunnedTime:float = 2.0


'''Plays animation'''
func Enter():
	bossAnimation.play(animationName)
	
	'''Set Chrono (Stunned for 2 seconds)''' 
	timer.start(stunnedTime)

func Exit():
	sprites.flip_h = !sprites.flip_h # Flip Sprites after stunned
	#timer.time_left = stunnedTime # Reset Timer
	
'''After stunned change to dash'''
func changeState():
	if boss.phase == 1: Transitioned.emit('dash')
	elif boss.phase == 2: Transitioned.emit('shoot')
	elif boss.phase == 3: Transitioned.emit('idle')
	else: Transitioned.emit('idle')
	
	
'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	bossAnimation.play(animationName)


func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	pass
		 
	
'''When timer ends, change state to dash'''
func _on_timer_timeout():
	#print("STUNNED TIME OUT!")
	timer.stop()
	changeState()
