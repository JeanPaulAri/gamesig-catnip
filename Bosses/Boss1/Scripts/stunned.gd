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
	boss.animationsNames[animationName] = true
	bossAnimation.play(animationName)
	
	'''Set Chrono (Stunned for 2 seconds)''' 
	timer.start(stunnedTime)

func Exit():
	boss.animationsNames[animationName] = false # Just to make sure every state we exit, has its animation var to false
	sprites.flip_h = !sprites.flip_h # Flip Sprites after stunned
	#timer.time_left = stunnedTime # Reset Timer
	
'''After stunned change to dash'''
func changeState():
	Transitioned.emit('dash')
	

func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	if not boss.animationsNames[animationName]:
		boss.animationsNames[animationName] = true
		bossAnimation.play(animationName)
		 
	
'''When timer ends, change state to dash'''
func _on_timer_timeout():
	#print("STUNNED TIME OUT!")
	timer.stop()
	changeState()
