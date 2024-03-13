extends Control

@export var Text: String = "Texto"
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.set_modulate(Color(255,255,255,0))
	$Sprite2D/RichTextLabel.text = Text


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	$AnimationPlayer.play("ENTER")


func _on_area_2d_body_exited(body):
	$AnimationPlayer.play("EXIT")
