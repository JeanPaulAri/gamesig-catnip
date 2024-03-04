extends State_Boss



#func enter():
	#super.enter()
	#owner.set_physics_process(true)
	#animation_player.play("Idle")
#
#func exit():
	#super.exit()
	#owner.set_physics_process(false)
#
#func transition():
	#var distance = owner.direction.length()
	##print(distance)
	#if distance <120 :
		#get_parent().change_state("Attack_Left")
		#
	#elif(distance > 500 ):
		#var chance = randi() % 2
		#match chance:
			#0:
				#get_parent().change_state("Beam")
			#1:
				#get_parent().change_state("Teleport")
