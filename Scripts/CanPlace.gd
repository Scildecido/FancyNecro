extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	.hide()




func _on_Area2D_body_entered(body):
		.show()


func _on_Area2D_body_exited(body):
	.hide()
