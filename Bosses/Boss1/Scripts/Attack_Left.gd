extends State_Boss

#func enter():
	#super.enter()
	#animation_player.play("Attack Right")
	#
 #
#func transition():
	#if owner.direction.length() > 120:
		#get_parent().change_state("Follow")
