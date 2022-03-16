extends Node

var slot_data = {}

#var slotbar_data = {"Slot1": 10001,
		#"Slot2": null,
		#"Slot3": null,
		#"Slot4": null,
		#"Slot5": null,
		#"Slot6": null,
		#"Slot7": null,
		#"Slot8": null,
		#"Slot9": null}

func _ready():
	var slot_data_file = File.new()
	slot_data_file.open("res://JSON files/SlotBar.json", File.READ)
	var slot_data_json = JSON.parse(slot_data_file.get_as_text())
	slot_data_file.close()
	slot_data = slot_data_json.result
	print(slot_data)
