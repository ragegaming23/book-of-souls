extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$FadeTransition.show()
	$FadeTransition/TimerLvl1.start()
	$FadeTransition/AnimationPlayer.play("Fade_out")
	

func _on_timer_lvl_1_timeout() -> void:
	$FadeTransition.hide()
