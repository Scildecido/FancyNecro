extends StaticBody2D

export(PackedScene) var skeleton

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Spawning.start()

func _on_Spawning_timeout():
	var skeletons = skeleton.instance()
	get_parent().add_child(skeletons)
	skeletons.position = $Position2D.global_position

	queue_free()
