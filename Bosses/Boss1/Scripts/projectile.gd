extends Projectile
class_name Projectile1_Boss1

@onready var boss = get_parent() # Boss is the parent every time
@onready var projectileSprite = $Sprite2D
@onready var projectileAnimation = $AnimationPlayer

'''Missile Speed'''
@onready var speed = 35.0


func _ready():
	velocity = Vector2(speed, 0.0) # Set any direction (will be updated)
	projectileAnimation.play("projectileAnimation")
	

func updateVelocity():
	'''Redirect Projectile towards player'''
	velocity = global_position.direction_to(boss.player.global_position) * speed
	
	'''Rotate Sprite towards player'''
	projectileSprite.set_rotation(velocity.angle())
	
	
	
