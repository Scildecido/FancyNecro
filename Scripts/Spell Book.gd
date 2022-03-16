extends Control

#onready var gridcontainer = get_node("")
onready var menu = $SpellBookMenu
signal stop
signal run

enum ScreenLoaded { NOTHING, JUST_MENU, PARTY_SCREEN, }
var screen_loaded = ScreenLoaded.NOTHING

#var selected_option: int = 0

func _ready():
	menu.visible = false
	#for i in PlayerData.inv_data.keys():
		#if PlayerData.inv_data[i]["Item"] != null:
			#var item_name = GameData.item_data[str(PlayerData.inv_data[i][Item])]["Name"]
			#var icon_texture = load("res://")
	#select_arrow.rect_position.y = 6 + (selected_option % 6 * 14)
	#This allows a select arrow to move around freely in a controlled environment. The positon of the arrow is sampled and any
	#inputs to move the arrow allow is to move a specific number of times till it wraps around. (arrow position can move till wrap X times by an extra amount per movement.
	

func _unhandled_input(event):
	match screen_loaded:
		ScreenLoaded.NOTHING:
			if event.is_action_pressed("book"):
				emit_signal('stop')
				menu.visible = true
				screen_loaded = ScreenLoaded.JUST_MENU
	
		ScreenLoaded.JUST_MENU:
			if event.is_action_pressed("book") or event.is_action_pressed("ui_cancel"):
				emit_signal('run')
				menu.visible = false
				screen_loaded = ScreenLoaded.NOTHING

				
		ScreenLoaded.PARTY_SCREEN:
			pass
	
			
func _on_SkeletonButton_pressed():
	get_node("SpellBookMenu/BookPage/VBoxContainer/SkeletonTab").show()
	get_node("SpellBookMenu/BookPage/VBoxContainer/CadaverTab").hide()


func _on_CadaverButton_pressed():
	get_node("SpellBookMenu/BookPage/VBoxContainer/SkeletonTab").hide()
	get_node("SpellBookMenu/BookPage/VBoxContainer/CadaverTab").show()



