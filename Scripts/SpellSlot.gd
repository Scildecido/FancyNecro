extends TextureRect


func get_drag_data(_pos):
	# Retrieve the information about the slot we're dragging
	var data = {}
	data["Name"] = get_parent().get_name()
	data["origin_node"] = self
	data["origin_texture"] = texture
	data["origin_item_id"] = data["Name"]
	data["origin_panel"] = "Spellbook"
	print(data)
	
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = texture
	drag_texture.rect_size = Vector2(18, 18)
	
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = -0.5 * drag_texture.rect_size
	set_drag_preview(control)
	
	return data
