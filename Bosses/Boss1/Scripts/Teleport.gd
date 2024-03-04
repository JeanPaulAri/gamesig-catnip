extends State_Boss


#var transicion:bool = false
#
#func enter():
	#super.enter()
	#animation_player.play("Teleport")
	#await Tp()
	#transicion = true
#
#
#func Tp():
	#var twee = create_tween()
	#twee.tween_property(owner,"position",player.position,0.8)
	#await twee.finished
	#
#func transition():
	#if transicion:
		#transicion = false
		#get_parent().change_state("Follow")
	#
	#
	#
