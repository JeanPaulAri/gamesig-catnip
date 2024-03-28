extends Node2D

'''Vars to track the current and previous state of the boss'''
var current_state: State
var previous_state: State

'''Dictionary that stores the name of the state as a STRING KEY and the state as VALUE (All String keys will be lowerCase)'''
var stateDic = {}

'''Ready Function inits the dictionary with all TuringMachineAI children and sets global vars'''
func _ready():
	
	'''Loop all childrens looking for states'''
	for child in get_children():
		if child is State: # Make sure that is a boss state and not other type of object
			print("Boss/Enemie State Found: ",child.name) # Debug
			stateDic[child.name.to_lower()] = child # Adding state to dictionary
			child.Transitioned.connect(updateState) # Connect signal from every state to updateState method
	
	'''Set prev and current state vars to idle (Every Boss/Enemie must have idle state. If not, we may need a "Null" state or something)'''
	current_state = stateDic['spawn']
	previous_state = stateDic['spawn']
	current_state.Enter()
	

'''Function that updates the previous and current state globals'''
func updateState(newState : String):
	
	print("Boss New State: ", newState)
	
	# Do nothing if is the same state (Not required if we code everything right :D)
	if current_state.name == newState:
		print("Same State!")
		#return
	
	# Debug: Check if state exists (Not required if we code everything right :D)
	if newState not in stateDic.keys():
		#print("The state ", newState," doesnt exist!")
		return
	
	'''Exit prev state and enter newState. Update globals'''
	current_state.Exit()
	previous_state = current_state
	current_state = stateDic[newState]
	current_state.Enter()

func currentAnimationFinished(anim_name):
	current_state.animation_finished(anim_name)

'''Call the current_state Process code'''
func _process(delta):
	current_state.Update(delta)


'''Call the current_state Physics code'''
func _physics_process(delta):
	current_state.Physics_Update(delta)
