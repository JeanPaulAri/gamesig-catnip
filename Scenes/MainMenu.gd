extends State
class_name MainMenu

#@export var CurrentWorld :=0


func Enter():
	pass
	
	
func Exit():
	#var CambiarAlMundo = "res://Scenes/World{CurrentWorld}.tscn"
	#get_parent().find_child(CambiarAlMundo.format({"CurrentWorld": CurrentWorld+1})).
	#print("here -> " + CambiarAlMundo.format({"CurrentWorld": CurrentWorld+1}))
	#get_tree().change_scene_to_file(CambiarAlMundo.format({"CurrentWorld": CurrentWorld}));
	Transitioned.emit(self,"ChangeWorld")
	pass
