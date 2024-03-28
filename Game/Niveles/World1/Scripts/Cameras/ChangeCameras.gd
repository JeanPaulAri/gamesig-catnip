extends Node


@export var currentCamera: String = "Floor2_PlayerCamera"
@export var strength: int = 0
func _on_floor_1_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor1_PlayerCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("FLOOR1")
		

func _on_floor_1_to_floor_2_area_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor1_to_Floor2Camera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("FLOOR1toFLOOR2")


func _on_floor_2_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor2_PlayerCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("FLOOR2")


func _on_floor_2_to_floor_3_area_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor2_to_Floor3Camera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("Floor2_to_Floor3Camera")


func _on_floor_3_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor3_PlayerCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("Floor3_PlayerCamera")



func _on_floor_3_fight_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor3_FightCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("Floor3_FightCamera")
	pass # Replace with function body.


func _on_floor_2_pre_elevator_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "Floor2_PreElevatorCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("Floor2_PreElevator")

	
		
		
func _on_elevator_pre_boss_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "ElevatorPreBossCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("ElevatorPreBoss")




func _on_pre_boss_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "PreBossCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("PreBossCamera")


func _on_boss_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "BossCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("BossCamera")


func _on_transicion_boss_body_entered(body):
	if(body.name == "Player"):
		get_parent().find_child(currentCamera).set_priority(0)
		currentCamera = "TransicionBossCamera"
		get_parent().find_child(currentCamera).set_priority(10)
		print("TransicionBossCamera")
