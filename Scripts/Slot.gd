extends TextureRect



func get_drag_data(_pos):
	# Retrieve the information about the slot we're dragging
	var slot_space_data = get_parent().get_name()
	if PlayerData.slot_data[slot_space_data]["Name"] != null:
		var data = {}
		data["origin_node"] = self
		data["Name"] = PlayerData.slot_data[slot_space_data]["Name"]
		data["origin_texture"] = texture
		data["origin_panel"] = "Slot"
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
	print(PlayerData.slot_data)

func _ready():
	pass
	
func can_drop_data(_pos, data):
	# Check if we can drop an item in this slot. Checks if dropping in this slot is possible.
	var target_slot = get_parent().get_name()
	if PlayerData.slot_data[target_slot]["Name"] == null:
		data["target_item_id"] = null
		data["target_texture"] = null
		return true
	else:
		data["target_item_id"] = PlayerData.slot_data[target_slot]
		data["target_texture"] = texture
		return true
		
func drop_data(_pos, data):
	# What happens when we drop an item in this slot
	#var origin_slot = data["origin_node"].get_parent().get_name()
	var target_slot = get_parent().get_name()
	#PlayerData.slot_data[origin_slot]["Name"] = data["target_item_id"]
	if data["origin_panel"] == "Spellbook":
		pass
	else:
		data["origin_node"].texture = data["target_texture"]
	PlayerData.slot_data[target_slot]["Name"] = data["Name"]
	texture = data["origin_texture"]
	print(data)



