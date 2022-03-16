extends YSort

export(PackedScene) var grave1
export(PackedScene) var skeleton

func _on_Player_summon(_position):
	var grave = grave1.instance()
	get_parent().add_child(grave)
	grave.position = _position


func _on_Grave_summon(_position):
	var skeletons = skeleton.instance()
	get_parent().add_child(skeletons)
	skeleton.position = _position

