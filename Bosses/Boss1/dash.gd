extends State
class_name boss1_dash

@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Replace this with animation name'''
@onready var animationName = 'Attack Right'
@onready var side_right:bool = true
@onready var dashSpeed:int = 4

'''Enter just plays animation'''
func Enter():
	boss.animations[animationName] = true
	animation.play(animationName)

'''Changes the direction of the dash'''
func Exit():
	boss.animations[animationName] = false # Just to make sure every state we exit, has its animation var to false
	side_right = not side_right 
	
	
'''After dash, it change to stunned'''
func changeState():
	if !boss.animations[animationName]: Enter()
	if side_right: # Dash to the Left
		if boss.global_position.x > boss.min_X: return # Still Dashing
	else: # Dash to the Right
		if boss.global_position.x < boss.max_X: return # Still Dashing
	Transitioned.emit('stunned')


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
	
