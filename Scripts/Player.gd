extends KinematicBody2D

const ACCELERATION = 1000
const MAX_SPEED = 135
const FRICTION = 1500

var is_moving = false
export(PackedScene) var grave1
signal summon
onready var placement = $Area2D/CanPlace


var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		is_moving = true
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			if Input.is_action_pressed("ui_up"):
				$AnimatedSprite.play("Run")
			if Input.is_action_pressed("ui_down"):
				$AnimatedSprite.play("Run")
			$AnimatedSprite.play("Run")
		elif Input.is_action_pressed("ui_up"):
			$AnimatedSprite.play("Behind")
		elif Input.is_action_pressed("ui_down"):
			$AnimatedSprite.play("default")

	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		is_moving = false
		$AnimatedSprite.play("default")

	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("ui_1") and PlayerData.slot_data["Slot1"]["Name"] != null:
		placement.show()

	if Input.is_action_just_pressed("left_click"):
		if placement.visible:
			placement.hide()
			$AnimatedSprite.show()
			$AnimatedSprite.play()
			emit_signal('summon', $Area2D/Position2D.global_position)
	elif Input.is_action_just_pressed("ui_cancel"):
		placement.hide()

func _on_SpellBookMenu_run():
	set_physics_process(true)


func _on_SpellBookMenu_stop():
	set_physics_process(false)

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()
	$AnimatedSprite.hide()



