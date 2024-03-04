extends State
class_name PlayerMovement

@onready var WalkSprite := $"../../WalkSprites"
@onready var AnimationPl := $"../../AnimationPlayer"
@onready var player := $"../.."
@onready var Dash:=$"../PlayerDash"
@export var PlayerSpeed=10.0
signal direction(dir)

func movePlayer(SPEED):
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_x:
		if(direction_x == 1):
			AnimationPl.play("Right") 
			WalkSprite.flip_h=false
		elif(direction_x==-1):
			AnimationPl.play("Left") 
			WalkSprite.flip_h=true
		player.velocity.x = direction_x * SPEED 
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
	if direction_y:
		player.velocity.y =  direction_y * SPEED 
	else:
		player.velocity.y = move_toward(player.velocity.y, 0, SPEED)
		
	player.move_and_slide()
	
	if (not Input.is_anything_pressed()):
		Transitioned.emit(self,"PlayerIdle")
	
	if Input.is_action_just_pressed("Dash") and !Dash.is_cooldown():
		emit_signal("direction",direction_x)
		Transitioned.emit(self,"PlayerDash")

func Enter():
	pass
	
func Update(_delta: float):
	movePlayer(PlayerSpeed)
