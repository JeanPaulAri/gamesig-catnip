extends State
class_name boss1_dash

@onready var boss = $"../.."
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'attack'
@onready var side_right:bool = true
@onready var dashSpeed:int = 4

'''Enter just plays animation'''
func Enter():
	#boss.animationsNames[animationName] = true
	animation_finished(animationName)

'''Changes the direction of the dash'''
func Exit():
	#boss.animationsNames[animationName] = false # Just to make sure every state we exit, has its animation var to false
	side_right = not side_right 
	
	
'''After dash, it change to stunned'''
func changeState():
	#if !boss.animationsNames[animationName]: Enter()
	if side_right: # Dash to the Left
		if boss.global_position.x > boss.min_X: return # Still Dashing
	else: # Dash to the Right
		if boss.global_position.x < boss.max_X: return # Still Dashing
	Transitioned.emit('stunned')


'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	#boss.animationsNames[animationName] = true
	if (anim_name != animationName): print("WEIRD: ", anim_name, " - ", animationName )
	bossAnimation.play(animationName)


func Update(_delta: float):
	pass

'''Dash towards oposite direction'''
func Physics_Update(_delta: float):
	if side_right: # Dash to the Left
		if boss.global_position.x > boss.min_X: 
			boss.global_position.x -= dashSpeed
	else: # Dash to the Right
		if boss.global_position.x < boss.max_X: 
			boss.global_position.x += dashSpeed
			
	
	changeState()
	

