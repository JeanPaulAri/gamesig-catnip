extends RigidBody2D

var impluse_randomizer : RandomNumberGenerator = RandomNumberGenerator.new()
@onready var CatNipTimer=$CatNipTimer
var currentBody

func _ready():
	impluse_randomizer.randomize()
	#var impluse:Vector2 = Vector2(impluse_randomizer.randi_range(10,-10),impluse_randomizer.randi_range(-400,-500))
	self.apply_impulse(self.position,Vector2(impluse_randomizer.randi_range(10,-10),-1000))

func _on_area_2d_body_entered(body):
	if body.name=="Player":
		CatNipTimer.start()
		currentBody=body
	pass

#func _on_area_2d_area_entered(area):
#	print("Catnip encontro arae")
#	if area is HitboxComponente:
#		print("Se consiguio catnip")
#		self.queue_free()
#	pass

func _on_timer_timeout():
	print("Se consiguio catnip")
	currentBody._get_catNip()
	self.queue_free()
