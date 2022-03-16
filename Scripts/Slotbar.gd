extends TextureRect



func get_drag_data(_pos):
	# Retrieve the information about the slot we're dragging
	var slot_space_data = get_parent().get_name()
	if PlayerData.slot_data[slot_space_data]["Item"] != null:
		var data = {}
		data["origin_node"] = self
		data["origin_item_id"] = PlayerData.slot_data[slot_space_data]["Item"]
		data["origin_spell_slot"] = GameData.item_data[str(PlayerData.slot_data[slot_space_data]["Item"])]
		data["origin_texture"] = texture
		
		var drag_texture = TextureRect.new()
		drag_texture.expand = true
		drag_texture.texture = texture
		drag_texture.rect_size = Vector2(18, 18)
		
		var control = Control.new()
		control.add_child(drag_texture)
		drag_texture.rect_position = -0.5 * drag_texture.rect_size
		set_drag_preview(control)
		
		return data

func _ready():
	pass
	
func can_drop_data(_pos, data):
	# Check if we can drop an item in this slot. Checks if dropping in this slot is possible.
	var target_slot = get_parent().get_name()
	if PlayerData.slot_data[target_slot]["Item"] == null:
		data["target_item_id"] = null
		data["target_texture"] = null
		return true
	else:
		data["target_item_id"] = PlayerData.slot_data[target_slot]["item"]
		data["target_texture"] = texture
		if data["origin_panel"] == "SpellBook":
			return true
	
	return true

func drop_data(_pos, data):
	# What happens when we drop an item in this slot
	texture = data["origin_texture"]


