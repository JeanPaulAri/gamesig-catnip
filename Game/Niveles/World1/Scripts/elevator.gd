extends Node2D
var active = false
var actual_y = 0

func _ready():
	actual_y = self.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func changeActive():
	active = !active
	
	
func Ascender():
	$Timer.start()
	

	
func _on_area_2d_body_entered(body):
	if body.name == "Player" and active == false:
		print("DEBUUGG")
		active = true
		var tween = create_tween()
		tween.tween_property(self,"position",Vector2(self.position.x, 2800),5)
		var varCall = Callable(self, "Ascender")
		tween.tween_callback(varCall)


func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self,"position",Vector2(self.position.x, actual_y),2)
	var varCall = Callable(self, "changeActive")
	tween.tween_callback(varCall)
