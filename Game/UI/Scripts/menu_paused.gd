extends Control


func _input(event):
	if (event.is_action_pressed("ui_paused")):
		if(self.visible == false):
			print("PAUSEADO")
			printValuesPlayer()
		self.visible = not get_tree().paused
		get_tree().paused = not get_tree().paused
		
		
	


func _on_aim_button_pressed():
	get_tree().get_nodes_in_group("Player")[0].aim += 1
	printValuesPlayer()
	


func _on_strength_button_pressed():
	get_tree().get_nodes_in_group("Player")[0].strength += 1
	printValuesPlayer()
	


func _on_agility_button_pressed():
	get_tree().get_nodes_in_group("Player")[0].agility += 1
	printValuesPlayer()
	


func printValuesPlayer():
	var player = get_tree().get_nodes_in_group("Player")[0]
	$ValuesText.text =  str(player.strength) + "\n" +   str(player.agility) + "\n" + str(player.aim)
	print("HERE -> ", player.strength, player.agility, player.aim)
