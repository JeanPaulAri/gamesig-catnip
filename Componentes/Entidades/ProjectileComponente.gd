extends CharacterBody2D
class_name Projectile

'''Every Projectile will need its velocity in order to update its position'''
'''Function to update velocity (Redirect towards player) or pass if we just need a straight line projectile'''
func updateVelocity():
	pass

'''Projectile custom physics'''
func PhysicsProcess(_delta):
	pass

'''Projectile custom process'''
func Process(_delta):
	pass

'''Update Velocity, run another custom physics and move_and_slice'''
func _physics_process(delta):
	updateVelocity()
	PhysicsProcess(delta)
	move_and_slide()

'''Just calling custom Process func'''
func _process(delta):
	Process(delta)


