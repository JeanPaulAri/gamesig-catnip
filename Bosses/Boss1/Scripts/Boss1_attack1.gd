extends State
class_name boss1_attack1

@onready var player = $"."
@onready var boss = $"../.."
@onready var animation = $"../../AnimationPlayer"

'''Set Random Generator object'''
@onready var random = RandomNumberGenerator.new()

'''Set possibilities for state change (AI)'''
@onready var possibilitie_idle = 1  # Possibilitie to idle after attack animation


'''Idle enter just plays idle animation'''
func Enter():
	boss.animations['Attack Right'] = true
	animation.play("Attack Right")
	#print("Player object: ", player.player.get_position())


func Exit():
	boss.animations['Attack Right'] = false # Just to make sure every state we exit, has its animation var to false


'''Change state to follow or long distance attack 'beam' (With random possibilities)'''
func changeState():
	if boss.animations['Attack Right']: return # Attack animation doesn finished yet
	
	if random.randf() < possibilitie_idle: 
		Transitioned.emit('idle')
	else: 
		Transitioned.emit('follow')
	

func Update(_delta: float):
	pass

'''Dont move (idle stays on the same place)'''
func Physics_Update(_delta: float):
	changeState()
	
