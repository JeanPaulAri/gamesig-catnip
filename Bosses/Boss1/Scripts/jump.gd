extends State
class_name boss1_jump

@onready var boss = $"../.."
@onready var sprites = $"../../BossSprites"
@onready var bossAnimation = $"../../bossAnimations"

'''Replace this with animation name'''
@onready var animationName = 'projectile'
@onready var actualPlataform:int = -1
@onready var plataformIndex:int
@onready var rng = RandomNumberGenerator.new()

'''Jump Physics Calculation'''
@onready var bossGravity:float = 0.6
@onready var TotalTicks:int = 50
@onready var currentTick:int
@onready var jumpVeloX:float # Calculado en base a los total ticks
@onready var jumpFallSpeed:float
@onready var actualPos:Vector2
@onready var targetPos:Vector2
@onready var bossPositionFloat: Vector2
@onready var yOffset: int = 128

func Enter():
	bossAnimation.play(animationName)
	
	'''Which Plataform?'''
	while true:
		plataformIndex = rng.randi_range(0, boss.plataforms.size()-1) # Random Number 
		if plataformIndex != actualPlataform: break

	actualPlataform = plataformIndex
	
	'''Calculate where to jump'''
	actualPos = boss.global_position
	targetPos = boss.plataforms[plataformIndex]
	targetPos.y -= yOffset # Half of teh body
	
	bossPositionFloat = boss.global_position
	
	#print("Actual Pos: ", actualPos)
	#print("Target Pos: ", targetPos)
	
	'''Calc JumpVeloX with ticks number'''
	currentTick = 0
	jumpVeloX = abs((targetPos.x - actualPos.x)) / TotalTicks
	
	'''BIG POSTRE FISICAAA (El pp de postigo es profe de fisica jsjsjs)'''
	jumpFallSpeed = ( (actualPos.y - targetPos.y) + bossGravity * TotalTicks * (TotalTicks+1) * 0.5 ) / TotalTicks
	
	#print("Init FallSpeed: ", jumpFallSpeed)
		
	

func Exit():
	pass
	
func changeState():
	Transitioned.emit('idle')


'''Function Activated when a boss animation is finished'''
func animation_finished(anim_name):
	bossAnimation.play(animationName)
	

func Update(_delta: float):
	pass


func Physics_Update(_delta: float):
	currentTick += 1
	
	
	''' Update Jump curve (Copy of boss global pos due precition loss)'''
	if actualPos.x < targetPos.x: bossPositionFloat.x += jumpVeloX
	else: bossPositionFloat.x -= jumpVeloX
	
	jumpFallSpeed -= bossGravity
	bossPositionFloat.y -= jumpFallSpeed
	
	boss.global_position.x = round(bossPositionFloat.x)
	boss.global_position.y = round(bossPositionFloat.y)
	
	#print(boss.global_position, " -> ", targetPos)
	
	if currentTick > TotalTicks: changeState()
	

