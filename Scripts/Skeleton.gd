extends StaticBody2D



func _ready():
	$AnimatedSprite.playing = true
	$AnimatedSprite.animation = "Summoned"


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.animation = "Idle"
