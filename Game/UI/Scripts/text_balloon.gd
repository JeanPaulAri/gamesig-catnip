extends Area2D

@export var textGlobal: String = "Texto"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.set_modulate(Color(255,255,255,0))
	$Sprite2D/RichTextLabel.text = "[center]" + textGlobal + "[/center]"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if(body.name == "Player"):
		$AnimationPlayer.play("ENTER")
	


func _on_body_exited(body):
	if(body.name == "Player"):
		$AnimationPlayer.play("EXIT")
	
