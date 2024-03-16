extends Node2D

var state = true
var timer_active = false
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	
	if (body.name == "Player" and not timer_active and PlayerGlobal.IsDashing==false):
		print("INICIO 1:",body.name)
		state = false;
		timer_active = true
		$Timer.start()
		



func _on_area_2d_body_exited(body):
	
	if (body.name == "Player"): 
		# Hacer que el player caiga, cuando desaparezca la plataforma
		pass
	


func _on_timer_timeout():
	if (state == false):
		state = true
		timer_active = true
		var tween = create_tween()
		tween.tween_property($Sprite2D,"modulate",Color(1,1,1,0.3),0.5)
		$StaticBody2D/CollisionShape2D.disabled = true
		$Area2D/CollisionShape2D.disabled = true
		$Timer.wait_time = 4.0
		$Timer.start()
		
	else:
		state = false
		timer_active = false
		var tween = create_tween()
		tween.tween_property($Sprite2D,"modulate",Color(1,1,1,1),0.5)
		$StaticBody2D/CollisionShape2D.disabled = false
		$Area2D/CollisionShape2D.disabled = false
		$Timer.wait_time = 2.0
		
		
	
