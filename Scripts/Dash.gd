extends Node2D

@onready var timer= $Dashtimer
@onready var timer2= $Cooldown

func start_dash(dur):
	timer.wait_time=dur
	timer.start()

func cool_down(dur):
	timer2.wait_time=dur
	timer2.start()

func is_dashing():
	return !timer.is_stopped()
	
func is_cooldown():
	return !timer2.is_stopped()
