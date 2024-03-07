extends State
class_name ChangeWorld

@export var CurrentWorld := 0


func Enter():
	var CambiarAlMundo = "res://Scenes/World{CurrentWorld}.tscn"
	get_tree().change_scene_to_file(CambiarAlMundo.format({"CurrentWorld": CurrentWorld+1}));
	print(CambiarAlMundo.format({"CurrentWorld": CurrentWorld+1}))

