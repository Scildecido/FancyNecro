extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func can_drop_data(_pos, _data):
	# Check if we can drop an item in this slot. Checks if dropping in this slot is possible.
	return true

func drop_data(_pos, data):
	# What happens when we drop an item in this slot
	var origin_slot = data["origin_node"].get_parent().get_name()
	data["origin_node"].texture = null
	PlayerData.slot_data[origin_slot]["Name"] = null
	print(data)
